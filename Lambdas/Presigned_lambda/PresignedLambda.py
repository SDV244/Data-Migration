"""
-*- coding: utf-8 -*-
========================
AWS Lambda
========================
Enhanced and Updated Code
========================
"""
import os
import logging
import json
import boto3

# Set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("Event received: %s", json.dumps(event))

    # Get the bucket name from environment variables
    bucket_name = os.environ.get("BUCKET_NAME")
    if not bucket_name:
        logger.error("Bucket name not found in environment variables.")
        return {
            "statusCode": 500,
            "body": json.dumps("Bucket name is not configured in environment variables!")
        }

    try:
        # Validate input parameters
        if not event.get("pathParameters") or not event.get("queryStringParameters"):
            logger.error("Missing pathParameters or queryStringParameters in the event.")
            return {
                "statusCode": 400,
                "body": json.dumps("Missing required parameters: username or filename.")
            }

        # Extract username and filename
        user_name = event["pathParameters"].get("username")
        file_name = event["queryStringParameters"].get("filename")

        if not user_name or not file_name:
            logger.error("Both 'username' and 'filename' are required.")
            return {
                "statusCode": 400,
                "body": json.dumps("Both 'username' and 'filename' are required.")
            }

        # Create an S3 client
        s3 = boto3.client("s3")

        # Generate a presigned POST URL for file upload
        response = s3.generate_presigned_post(
            Bucket=bucket_name,
            Key=f"{user_name}/{file_name}",
            Fields={"Content-Type": "image/"},
            Conditions=[
                ["starts-with", "$Content-Type", "image/"],
                ["content-length-range", 0, 10485760]  # Max size: 10 MB
            ],
            ExpiresIn=3600  # URL expires in 1 hour
        )

        logger.info("Presigned POST URL successfully generated.")
        return {
            "statusCode": 200,
            "headers": {
                "Content-Type": "application/json",
                "Access-Control-Allow-Origin": "*"  # Enable CORS
            },
            "body": json.dumps(response)
        }

    except Exception as e:
        logger.error(f"Error generating presigned URL: {e}")
        return {
            "statusCode": 500,
            "body": json.dumps("Error generating presigned URL.")
        }
