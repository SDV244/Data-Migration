import json
import boto3
import datetime
import os
import urllib.parse
import pandas as pd
import hashlib
from io import BytesIO, StringIO

def get_dynamo_schema(dynamodb_client, table_name, file_name, file_type='csv', username=None):
    """Get schema from DynamoDB with type normalization and case insensitivity."""
    try:
        response = dynamodb_client.get_item(
            TableName=table_name,
            Key={
                'FileName': {'S': file_name},
                'FileType': {'S': file_type}
            }
        )
        
        if 'Item' not in response:
            return {'success': False, 'error': 'Schema not found', 'error_type': 'SCHEMA_NOT_FOUND'}

        item = response['Item']
        
        # Validate user permissions
        allowed_user = item.get('user', {}).get('S', '')
        if username != allowed_user:
            return {'success': False, 'error': 'Unauthorized user', 'error_type': 'UNAUTHORIZED_USER'}

        schema_data = {'file_schema': {}, 'file_drop_columns': [], 'file_key_columns': [], 'sheets_schema': {}}

        def process_columns(columns):
            data_types = {}
            drop_columns = []
            key_columns = []
            for col in columns:
                if 'M' in col:
                    col_data = col['M']
                    col_name = col_data['ColumnName']['S'].strip().lower()
                    col_type = col_data['DataType']['S'].lower()
                    type_mapping = {
                        'int': 'integer',
                        'float': 'double',
                        'bool': 'boolean'
                    }
                    col_type = type_mapping.get(col_type, col_type)
                    data_types[col_name] = col_type
                    if col_data.get('DropColumn', {}).get('BOOL', False):
                        drop_columns.append(col_name)
                    if col_data.get('KeyColumn', {}).get('BOOL', False):
                        key_columns.append(col_name)
            return data_types, drop_columns, key_columns

        # Process CSV schema
        file_columns = item.get('FileColumn', {}).get('M', {}).get('FileColumns', {}).get('L', [])
        file_data_types, file_drop, file_key = process_columns(file_columns)
        schema_data['file_schema'] = file_data_types
        schema_data['file_drop_columns'] = file_drop
        schema_data['file_key_columns'] = file_key

        # Process Excel sheets
        sheets_data = item.get('FileColumn', {}).get('M', {}).get('Sheets', {}).get('M', {})
        for sheet_name, sheet_info in sheets_data.items():
            sheet_columns = sheet_info.get('L', [])
            sheet_data_types, sheet_drop, sheet_key = process_columns(sheet_columns)
            schema_data['sheets_schema'][sheet_name.strip().lower()] = {
                'data_types': sheet_data_types,
                'drop_columns': sheet_drop,
                'key_columns': sheet_key
            }

        if not schema_data['file_schema'] and not schema_data['sheets_schema']:
            return {'success': False, 'error': 'Invalid schema', 'error_type': 'INVALID_SCHEMA'}

        return {'success': True, 'schema': schema_data}
        
    except Exception as e:
        print(f"Schema Error: {str(e)}")
        return {'success': False, 'error': str(e), 'error_type': 'PROCESSING_ERROR'}

def validate_data_type(value, expected_type):
    """Validate individual data type with enhanced checks and normalization."""
    try:
        value = str(value).strip()
        expected_type = expected_type.lower()

        # Normalize type names for compatibility
        type_mapping = {
            'int': 'integer',
            'float': 'double',
            'bool': 'boolean'
        }
        expected_type = type_mapping.get(expected_type, expected_type)

        if not value:
            return True, None, None

        # Integer validation
        if expected_type == 'integer':
            try:
                int(value)
                return True, 'integer', None
            except ValueError:
                return False, 'string', f"Value '{value}' cannot be converted to integer"

        # Float/Double validation
        if expected_type == 'double':
            try:
                float(value)
                return True, 'double', None
            except ValueError:
                return False, 'string', f"Value '{value}' cannot be converted to double"

        # String validation
        if expected_type == 'string':
            return True, 'string', None

        if expected_type == 'timestamp':
            formats = [
                '%Y-%m-%d', '%d-%m-%Y', '%Y/%m/%d', '%d/%m/%Y',
                '%Y-%m-%d %H:%M:%S', '%d-%m-%Y %H:%M:%S', '%m-%d-%Y'
            ]
            parsed_date = None
            for fmt in formats:
                try:
                    parsed_date = datetime.datetime.strptime(value, fmt)
                    break
                except ValueError:
                    continue
            if parsed_date:
                # Format to desired output format
                formatted_date = parsed_date.strftime('%Y-%m-%d %H:%M:%S')
                return True, 'timestamp', formatted_date
            return False, 'string', "Invalid date format"

        # Boolean validation
        if expected_type == 'boolean':
            if value.lower() in {'true', '1', 'yes', 't', 'y'}:
                return True, 'boolean', 'true'
            if value.lower() in {'false', '0', 'no', 'f', 'n'}:
                return True, 'boolean', 'false'
            return False, 'string', f"Value '{value}' cannot be converted to boolean"

        return False, 'unknown', f"Unsupported data type: {expected_type}"

    except Exception as e:
        return False, None, f"Validation error: {str(e)}"

def validate_sheet_content(sheet_df, schema):
    """Validate Excel sheet content against schema."""
    structured_errors = []
    converted_data = []
    
    try:
        headers = [col.strip().lower() for col in sheet_df.columns]
        schema_cols = set(schema.keys())
        csv_cols = set(headers)

        # Validate columns
        for col in schema_cols - csv_cols:
            structured_errors.append({
                'error_type': 'MISSING_COLUMN',
                'column': col,
                'message': f"Missing required column: {col}"
            })

        for col in csv_cols - schema_cols:
            structured_errors.append({
                'error_type': 'EXTRA_COLUMN',
                'column': col,
                'message': f"Unexpected column: {col}"
            })

        if structured_errors:
            return structured_errors, converted_data

        # Validate rows
        for row_num, (_, row) in enumerate(sheet_df.iterrows(), start=2):
            row_errors = []
            row_data = {}

            for col_name, expected_type in schema.items():
                value = str(row[col_name]).strip() if col_name in row else ''
                is_valid, actual_type, formatted_value = validate_data_type(value, expected_type)
                
                if not is_valid:
                    structured_errors.append({
                        'error_type': 'INVALID_DATA_TYPE',
                        'column': col_name,
                        'row': row_num,
                        'value': value,
                        'expected_type': expected_type,
                        'actual_type': actual_type,
                        'message': f"Row {row_num}: Invalid data type (Value: '{value}')"
                    })
                else:
                    # Use formatted value for timestamp types
                    row_data[col_name] = formatted_value if formatted_value else value

            if not row_errors:
                converted_data.append(row_data)

        return structured_errors, converted_data

    except Exception as e:
        structured_errors.append({
            'error_type': 'PROCESSING_ERROR',
            'message': f"Sheet validation error: {str(e)}"
        })
        return structured_errors, converted_data

def process_excel_file(file_content, required_sheets):
    """Process Excel file with case-insensitive sheet name matching."""
    try:
        xls = pd.ExcelFile(BytesIO(file_content))
        sheet_results = {}
        validation_passed = True
        all_errors = []
        all_data = {}

        # Normalize sheet names: lowercase and strip whitespace
        actual_sheets = {sheet.strip().lower(): sheet for sheet in xls.sheet_names}
        required_sheets_normalized = {
            name.strip().lower(): schema 
            for name, schema in required_sheets.items()
        }

        # Find missing sheets using normalized names
        missing_sheets = [
            orig_name for orig_name in required_sheets.keys()
            if orig_name.strip().lower() not in actual_sheets
        ]

        for sheet in missing_sheets:
            all_errors.append({
                'error_type': 'MISSING_SHEET',
                'message': f"Required sheet '{sheet}' not found"
            })
            validation_passed = False

        # Process found sheets using original casing
        for orig_name, schema in required_sheets.items():
            normalized_name = orig_name.strip().lower()
            if normalized_name in actual_sheets:
                actual_sheet_name = actual_sheets[normalized_name]
                df = pd.read_excel(xls, sheet_name=actual_sheet_name)
                df.columns = [col.strip().lower() for col in df.columns]
                
                data_types = schema['data_types']
                errors, valid_data = validate_sheet_content(df, data_types)
                
                sheet_results[orig_name] = {
                    'errors': errors,
                    'valid_rows': len(valid_data),
                    'total_rows': len(df)
                }
                
                all_errors.extend(errors)
                if errors:
                    validation_passed = False
                else:
                    df_valid = pd.DataFrame(valid_data)
                    df_valid = df_valid.drop(columns=schema['drop_columns'])
                    key_columns = schema['key_columns']
                    if key_columns:
                        df_valid['HashKey'] = df_valid[key_columns].astype(str).apply(
                            lambda x: '_'.join(x), axis=1
                        ).apply(lambda x: hashlib.sha256(x.encode()).hexdigest())
                    all_data[orig_name] = df_valid

        return {
            'success': validation_passed,
            'errors': all_errors,
            'data': all_data,
            'sheet_results': sheet_results
        }

    except Exception as e:
        return {
            'success': False,
            'errors': [{
                'error_type': 'PROCESSING_ERROR',
                'message': f"Excel processing error: {str(e)}"
            }]
        }

def save_as_csv(s3_client, bucket, base_path, dataframe, original_filename):
    """Save DataFrame with folder structure: {file_name}/{sheet}/{file_name}.csv"""
    try:
        # Add UTC timestamp in specified format
        dataframe = dataframe.copy()
        dataframe['audit_loaded_date'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        # Clean filename and construct final path
        file_name = os.path.splitext(original_filename)[0]
        full_key = f"{base_path}/{file_name}.csv"

        # Convert to CSV using pandas
        csv_buffer = StringIO()
        dataframe.to_csv(csv_buffer, index=False, sep=';')
        csv_buffer.seek(0)

        # Upload to S3
        s3_client.put_object(
            Bucket=bucket,
            Key=full_key,
            Body=csv_buffer.getvalue().encode('utf-8')
        )
        print(f"File saved to: s3://{bucket}/{full_key}")
        return full_key

    except Exception as e:
        print(f"CSV save error: {str(e)}")
        raise

def insert_validation_log(dynamodb_client, table_name, filename, validation_passed, username, errors=None, metrics=None):
    """Log validation results with structured errors."""
    try:
        timestamp_id = int(datetime.datetime.now().timestamp() * 1000)
        
        item = {
            'FileName': {'S': filename},
            'Id': {'N': str(timestamp_id)},
            'ValidationTimestamp': {'S': datetime.datetime.now().isoformat()},
            'ValidationPassed': {'BOOL': validation_passed},
            'UserName': {'S': username},
            'ExpireAt': {'S': (datetime.datetime.now() + datetime.timedelta(days=1)).isoformat()}
        }

        if errors:
            item['ValidationErrors'] = {'S': json.dumps([
                {
                    'error_type': e.get('error_type'),
                    'column': e.get('column'),
                    'value': e.get('value'),
                    'actual_type': e.get('actual_type'),
                    'expected_type': e.get('expected_type'),
                    'message': e.get('message')
                } for e in errors[:10]
            ])}

        if metrics:
            item.update({
                'ValidRows': {'N': str(metrics.get('validRows', 0))},
                'TotalRows': {'N': str(metrics.get('totalRows', 0))}
            })

        print(f"Inserting validation log into DynamoDB: {item}")
        dynamodb_client.put_item(
            TableName=table_name,
            Item=item
        )
        print("Validation log inserted successfully.")
        return True
        
    except Exception as e:
        print(f"Error logging validation result: {str(e)}")
        return False

def lambda_handler(event, context):
    """Main Lambda handler."""
    s3 = boto3.client('s3')
    dynamodb = boto3.client('dynamodb')
    
    config = {
        'source_bucket': os.environ['SOURCE_BUCKET'],
        'target_bucket': os.environ['TARGET_BUCKET'],
        'target_prefix': os.environ['TARGET_PREFIX'],
        'schema_table': os.environ['SCHEMA_TABLE'],
        'logs_table': os.environ['LOGS_TABLE']
    }

    try:
        record = event['Records'][0]['s3']
        bucket = record['bucket']['name']
        encoded_key = record['object']['key']
        key = urllib.parse.unquote_plus(encoded_key)
        username = key.split('/')[-2]
        file_name = key.split('/')[-1]
        file_type = file_name.split('.')[-1].lower()

        print(f"Processing file: {key} (Type: {file_type})")

        # Get schema
        schema_result = get_dynamo_schema(dynamodb, config['schema_table'], file_name, file_type, username)
        if not schema_result['success']:
            structured_errors = [{
                'error_type': schema_result['error_type'],
                'message': schema_result['error']
            }]
            
            insert_validation_log(
                dynamodb_client=dynamodb,
                table_name=config['logs_table'],
                filename=key,
                validation_passed=False,
                username=username,
                errors=structured_errors,
                metrics={'validRows': 0, 'totalRows': 0}
            )
            
            return {
                'statusCode': 400,
                'body': json.dumps({
                    'filename': key,
                    'validationPassed': False,
                    'errors': [schema_result['error']]
                })
            }

        schema_data = schema_result['schema']

        # Read file content
        response = s3.get_object(Bucket=bucket, Key=key)
        file_content = response['Body'].read()

        # Initialize validation_results
        validation_results = {}
        all_errors = []
        validation_passed = False

        # Process file based on type
        if file_type == 'csv':
            df = pd.read_csv(BytesIO(file_content), delimiter=';')
            structured_errors, converted_data = validate_sheet_content(df, schema_data['file_schema'])
            validation_passed = len(structured_errors) == 0
            all_errors = structured_errors
            validation_results = {
                'csv': {
                    'valid_rows': len(converted_data),
                    'total_rows': len(df)
                }
            }
            if validation_passed:
                df = pd.DataFrame(converted_data)
                df = df.drop(columns=schema_data['file_drop_columns'])
                key_columns = schema_data['file_key_columns']
                if key_columns:
                    df['HashKey'] = df[key_columns].astype(str).apply(
                        lambda x: '_'.join(x), axis=1
                    ).apply(lambda x: hashlib.sha256(x.encode()).hexdigest())
        elif file_type == 'xlsx':
            required_sheets = {
                sheet_name: {
                    'data_types': details['data_types'],
                    'drop_columns': details['drop_columns'],
                    'key_columns': details['key_columns']
                }
                for sheet_name, details in schema_data['sheets_schema'].items()
            }
            excel_result = process_excel_file(file_content, required_sheets)
            validation_passed = excel_result['success']
            all_errors = excel_result['errors']
            validation_results = excel_result.get('sheet_results', {})
        else:
            raise ValueError(f"Unsupported file type: {file_type}")

        # Insert validation log
        print(f"Validation results: {validation_results}")
        print(f"All errors: {all_errors}")
        insert_validation_log(
            dynamodb_client=dynamodb,
            table_name=config['logs_table'],
            filename=key,
            validation_passed=validation_passed,
            username=username,
            errors=all_errors,
            metrics={
                'validRows': sum(sheet.get('valid_rows', 0) for sheet in validation_results.values()),
                'totalRows': sum(sheet.get('total_rows', 0) for sheet in validation_results.values())
            }
        )

        if validation_passed:
            # Save processed data
            file_base = os.path.splitext(file_name)[0]
            if file_type == 'xlsx':
                for sheet_name, df in excel_result['data'].items():
                    save_as_csv(
                        s3_client=s3,
                        bucket=config['target_bucket'],
                        base_path=f"{file_base}/{sheet_name.strip().lower()}",
                        dataframe=df,
                        original_filename=file_name
                    )
            elif file_type == 'csv':
                save_as_csv(
                    s3_client=s3,
                    bucket=config['target_bucket'],
                    base_path=file_base,
                    dataframe=df,
                    original_filename=file_name
                )

        return {
            'statusCode': 200,
            'body': json.dumps({
                'filename': key,
                'validationPassed': validation_passed,
                'errors': [e.get('message', str(e)) for e in all_errors],
                'sheetResults': validation_results if file_type == 'xlsx' else {}
            })
        }

    except Exception as e:
        error_msg = f"Processing error: {str(e)}"
        print(error_msg)
        return {
            'statusCode': 500,
            'body': json.dumps({'error': error_msg})
        }