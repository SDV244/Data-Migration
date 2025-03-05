import boto3
import os

def lambda_handler(event, context):
    print(event)

    # Inicializar cliente de DynamoDB
    db = boto3.client('dynamodb')

    # Verificar el tipo de evento (CONNECT o DISCONNECT)
    route_key = event['requestContext']['routeKey']
    print('**********')
    print(route_key)

    # --- CONECTAR ---
    if route_key == '$connect':
        # Validar que 'user_id' esté presente
        user_id = event.get('queryStringParameters', {}).get('user_id')
        if not user_id:
            return {
                'statusCode': 400,
                'body': 'Bad Request: user_id is required'
            }

        put_params = {
            'TableName': os.environ['TABLE_NAME'],
            'Item': {
                'ConnectionId': {
                    'S': event['requestContext']['connectionId']
                },
                'Username': {
                    'S': user_id
                }
            }
        }

        try:
            # Insertar ConnectionId y Username en DynamoDB
            db.put_item(**put_params)

            return {
                'statusCode': 200,
                'body': 'Connected'
            }

        except Exception as e:
            print(f'Error al conectar: {e}')
            return {
                'statusCode': 500,
                'body': f'Error en la conexión: {str(e)}'
            }

    # --- DESCONECTAR ---
    elif route_key == '$disconnect':
        delete_params = {
            'TableName': os.environ['TABLE_NAME'],
            'Key': {
                'ConnectionId': {
                    'S': event['requestContext']['connectionId']
                }
            }
        }

        try:
            # Eliminar ConnectionId de DynamoDB
            db.delete_item(**delete_params)

            return {
                'statusCode': 200,
                'body': 'Disconnected'
            }

        except Exception as e:
            print(f'Error al desconectar: {e}')
            return {
                'statusCode': 500,
                'body': f'Error en la desconexión: {str(e)}'
            }

    # Si el evento no es ni CONNECT ni DISCONNECT
    return {
        'statusCode': 400,
        'body': 'Bad Request: Invalid route key'
    }

