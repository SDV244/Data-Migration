import boto3
import bcrypt
import json
from decimal import Decimal
from boto3.dynamodb.conditions import Attr
import os

dynamodb = boto3.resource('dynamodb')
users_table = dynamodb.Table(os.environ['U_TABLE_NAME'])
validation_logs_table = dynamodb.Table(os.environ['VL_TABLE_NAME'])

def lambda_handler(event, context):
    print(event)
    try:
        print('***')
        action = event.get('action')
        print(action)

        if not action:
            return {"statusCode": 400, "body": json.dumps({"error": "Falta el campo 'action'"})}

        if action == "insert":
            return insert_user(event)
        elif action == "edit":
            return edit_user(event)
        elif action == "delete":
            return delete_user(event)
        elif action == "query":
            return query_user(event)
        elif action == "get_all":
            return get_all_users()
        elif action == "get_validation_logs":
            return get_validation_logs()  # Nueva función
        elif action == "get_validation_logs_user":
            return get_validation_logs_user(event)
        else:
            return {"statusCode": 400, "body": json.dumps({"error": "Acción no válida"})}

    except Exception as e:
        return {"statusCode": 500, "body": json.dumps({"error": str(e)})}


# Función para insertar un usuario
def insert_user(event):
    email = event.get('email')
    name = event.get('name')
    role = event.get('role')
    password = event.get('password')

    if not email or not name or not role or not password:
        return {"statusCode": 400, "body": json.dumps({"error": "Todos los campos son requeridos"})}

    response = users_table.get_item(Key={'Email': email})

    if 'Item' in response:
        return {"statusCode": 400, "body": json.dumps({"error": "El usuario ya existe"})}

    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

    users_table.put_item(Item={
        'Email': email,
        'Name_User': name,
        'Role_User': role,
        'Password_User': hashed_password
    })

    return {"statusCode": 201, "body": json.dumps({"message": "Usuario creado exitosamente"})}

# Función para editar un usuario
def edit_user(event):
    email = event.get('email')
    name = event.get('name')
    role = event.get('role')
    password = event.get('password')

    if not email:
        return {"statusCode": 400, "body": json.dumps({"error": "Se requiere el email para editar"})}

    update_expression = []
    expression_values = {}

    if name:
        update_expression.append("Name_User = :n")
        expression_values[":n"] = name
    if role:
        update_expression.append("Role_User = :r")
        expression_values[":r"] = role
    if password:
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
        update_expression.append("Password_User = :p")
        expression_values[":p"] = hashed_password

    if not update_expression:
        return {"statusCode": 400, "body": json.dumps({"error": "Nada que actualizar"})}

    users_table.update_item(
        Key={'Email': email},
        UpdateExpression="SET " + ", ".join(update_expression),
        ExpressionAttributeValues=expression_values
    )

    return {"statusCode": 200, "body": json.dumps({"message": "Usuario actualizado correctamente"})}

# Función para eliminar un usuario
def delete_user(event):
    email = event.get('email')

    if not email:
        return {"statusCode": 400, "body": json.dumps({"error": "Se requiere el email para eliminar"})}

    users_table.delete_item(Key={'Email': email})

    return {"statusCode": 200, "body": json.dumps({"message": "Usuario eliminado correctamente"})}

# Función para validar usuario y contraseña
def query_user(event):
    email = event.get('email')
    password = event.get('password')

    if not email or not password:
        return {"statusCode": 400, "body": json.dumps({"error": "Faltan datos"})}

    response = users_table.get_item(Key={'Email': email})

    if 'Item' not in response:
        return {"statusCode": 401, "body": json.dumps({"error": "Credenciales incorrectas"})}

    user = response['Item']

    if not bcrypt.checkpw(password.encode('utf-8'), user['Password_User'].encode('utf-8')):
        return {"statusCode": 401, "body": json.dumps({"error": "Credenciales incorrectas"})}

    return {
        "statusCode": 200,
        "body": json.dumps({"Name": user['Name_User'], "Role": user['Role_User']})
    }

# Función para obtener todos los usuarios
def get_all_users():
    response = users_table.scan()

    if 'Items' not in response or not response['Items']:
        return {"statusCode": 404, "body": json.dumps({"error": "No hay usuarios registrados"})}

    users = [{"Email": user["Email"], "Name": user["Name_User"], "Role": user["Role_User"]} for user in response['Items']]

    return {"statusCode": 200, "body": json.dumps(users)}


# Nueva función para obtener los logs de validación
# Nueva función para obtener todos los campos de los logs de validación
def get_validation_logs():
    response = validation_logs_table.scan()

    if 'Items' not in response or not response['Items']:
        return {"statusCode": 404, "body": json.dumps({"error": "No se encontraron logs de validación"})}

    # Convertir Decimals a tipos serializables para todos los campos
    logs = [decimal_to_float(log) for log in response['Items']]

    return {"statusCode": 200, "body": json.dumps(logs)}


# Helper para convertir Decimals a tipos de datos serializables
def decimal_to_float(obj):
    if isinstance(obj, list):
        return [decimal_to_float(item) for item in obj]
    elif isinstance(obj, dict):
        return {k: decimal_to_float(v) for k, v in obj.items()}
    elif isinstance(obj, Decimal):
        return float(obj)
    else:
        return obj


# Nueva función para obtener los logs de validación filtrados por UserName
def get_validation_logs_user(event):
    username = event.get('username')
    
    # Validar si el username está presente
    if not username:
        return {"statusCode": 400, "body": json.dumps({"error": "El campo 'username' es requerido"})}

    # Escaneo con condición para filtrar por UserName
    response = validation_logs_table.scan(
        FilterExpression=Attr('UserName').eq(username)
    )

    if 'Items' not in response or not response['Items']:
        return {"statusCode": 404, "body": json.dumps({"error": f"No se encontraron logs de validación para el usuario {username}"})}

    # Convertir Decimals a tipos serializables para todos los campos
    logs = [decimal_to_float(log) for log in response['Items']]

    return {"statusCode": 200, "body": json.dumps(logs)}
