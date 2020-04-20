# Simple guide to KMS

Taken from [this comment](https://github.com/awslabs/serverless-application-model/issues/48#issuecomment-312810871)

1. Encrypt the key using aws cli:
```
aws kms encrypt --key-id KMS_KEY_ID --plaintext THE_SECRET_TOKEN
```
2. Include the encrypted token, and KmsKeyArn that you used in Step 1 inside my SAM yaml:

```
KmsKeyArn: arn:aws:kms:us-east-1:xxx:key/yyy
Environment:
        Variables:
          SECRET_TOKEN: '...524krvmX9JA='
```
3. Within the lambda, decrypt the ENV. Ex using Python
```
import boto3
import os
from base64 import b64decode

ENCRYPTED = os.environ['SECRET_TOKEN']
DECRYPTED = boto3.client('kms').decrypt(CiphertextBlob=b64decode(ENCRYPTED))['Plaintext'].decode('utf-8')
```
