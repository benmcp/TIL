# jq commands

List buckets and show only `bucket name`
```
aws s3api list-buckets --profile personal | jq '.Buckets[].Name'
```
