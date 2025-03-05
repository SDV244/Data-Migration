import json
import boto3
import os
from boto3.dynamodb.types import TypeDeserializer
from decimal import Decimal

# Initialize AWS clients
dynamodb = boto3.client('dynamodb')
deserializer = TypeDeserializer()

def get_active_connections(username=None):
    """Obtiene todas las conexiones activas de la tabla websocketManager o solo las que coinciden con el UserName"""
    connections = []
    try:
        paginator = dynamodb.get_paginator('scan')
        for page in paginator.paginate(TableName='webSocketManager'):
            for item in page['Items']:
                # Si se especifica un username, solo devolver la conexión que coincida con Username
                if username is None or item.get('Username', {}).get('S') == username:
                    connections.append(item['ConnectionId']['S'])
        return connections
    except Exception as e:
        print(f"Error getting connections: {str(e)}")
        return []

def remove_connection(connection_id):
    """Elimina una conexión de la tabla websocketManager"""
    try:
        dynamodb.delete_item(
            TableName='webSocketManager',
            Key={'ConnectionId': {'S': connection_id}}
        )
    except Exception as e:
        print(f"Error removing connection {connection_id}: {str(e)}")

def deserialize_dynamodb_item(dynamodb_item):
    """Convierte un item de DynamoDB a un diccionario Python"""
    return {k: deserializer.deserialize(v) for k, v in dynamodb_item.items()}

def decimal_default(obj):
    """Convierte los objetos Decimal en float para que sean serializables en JSON"""
    if isinstance(obj, Decimal):
        return float(obj)
    raise TypeError

def broadcast_message(api_client, connections, message):
    """Envía un mensaje a todas las conexiones activas"""
    for connection_id in connections:
        try:
            api_client.post_to_connection(
                Data=json.dumps(message, default=decimal_default),  # Convertir Decimals
                ConnectionId=connection_id
            )
        except api_client.exceptions.GoneException:
            # Eliminar conexiones obsoletas
            remove_connection(connection_id)
        except Exception as e:
            print(f"Error sending message to {connection_id}: {str(e)}")

def lambda_handler(event, context):
    """Función principal que procesa los eventos del stream de DynamoDB"""
    try:
        # Obtener el endpoint del WebSocket desde las variables de entorno
        endpoint_url = os.environ['WEBSOCKET_ENDPOINT']
        
        # Inicializar el cliente de API Gateway
        api_client = boto3.client('apigatewaymanagementapi', 
                                  endpoint_url=endpoint_url)
        
        # Procesar cada registro del stream
        for record in event['Records']:
            # Solo procesar eventos INSERT y MODIFY
            if record['eventName'] in ['INSERT', 'MODIFY']:
                # Deserializar los nuevos datos
                new_image = deserialize_dynamodb_item(record['dynamodb']['NewImage'])
                
                # Extraer el 'UserName' del nuevo registro
                username = new_image.get('UserName')
                if not username:
                    continue  # Si no hay un UserName, ignorar este evento
                
                # Obtener las conexiones activas con el mismo UserName
                connections = get_active_connections(username=username)
                if not connections:
                    continue  # Si no hay conexiones para este UserName, no enviar mensaje
                
                # Preparar el mensaje
                message = {
                    'eventType': record['eventName'],
                    'data': new_image,
                    'tableName': record['eventSourceARN'].split('/')[1]
                }
                
                # Enviar el mensaje solo a las conexiones que coinciden con el UserName
                broadcast_message(api_client, connections, message)

        return {
            'statusCode': 200,
            'body': 'Messages sent successfully'
        }

    except Exception as e:
        print(f"Error processing stream: {str(e)}")
        return {
            'statusCode': 500,
            'body': f'Error processing stream: {str(e)}'
        }