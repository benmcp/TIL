# Aws CLI Cheatsheet

## EC2

Check regions:
```
aws ec2 describe-regions
```
Output as text
```
aws ec2 describe-regions --output text
```
Output as table
```
aws ec2 describe-regions --output table
```
Cut output:
```
aws ec2 describe-regions --output text | cut -f 2
```

Credentials location
```
cat ~/.aws/credentials
```

Execute as another profile:
```
aws ec2 describe-instances --profile user2
```
## IAM

Upload ssl cert
```
aws iam upload-server-certificate \
--server-certificate-name sample.com \
--certificate-body file://sample_com.crt \
--private-key file://sample.com.key \
--certificate-chain file://sample_com.ca-bundle
```

List Certs
```
aws iam list-server-certificates
```

Delete Cert
```
aws iam delete-server-certificate \
--server-certificate-name sample.com
```
