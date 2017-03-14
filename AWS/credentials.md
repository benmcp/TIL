# Credentials

Got to `aws directory`
```
cd ~/.aws
```
Open `credentials`

This is the credentials section for your `AWS CLI` where you can create different profiles if you have multiple credentials/users.

For example
```
vi ~/.aws/credentials`
#### add the following

[someprofile]
aws_access_key_id = SOMEACCESSKEYID
aws_secret_access_key = SOMESECRETEKEY

#### ESC :wq
```

Now, to configure the aws cli using our new user `someprofile`
```
aws configure --profile someprofile
```

