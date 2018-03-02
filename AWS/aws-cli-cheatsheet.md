# Aws CLI Cheatsheet

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
