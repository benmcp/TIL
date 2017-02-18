# How to setup a scalable cluster on AWS

Over the past several months I've been working with a lot of AWS. Because of this I've become increasingly familar with various aspects of AWS. This is an attempt to solidify my learnings and create a secure cluster to host a site. I'm currently working/writing this on a Mac OS.

## Conents

1. Setup AMI
2. Kubernetes to control container orchestration
3. Docker to manage the containers
4. CodeBuild/CodeDeploy/CodePiepline for CD/CI
5. Jenkins to run the build/checks
6. Sit within own unique VPN

This is a lot of content/work so lets begin. (alternatively you could just use a 3rd party to automate this entire process but where's the fun in that!)

### Kubernetes to control container orchestration

### Setup AMI

Install kubernetes
```
wget -O https://github.com/kubernetes/kubernetes/releases/download/v1.4.6/kubernetes.tar.gz
sudo cp kubernetes/platforms/darwin/amd64/kubectl /usr/local/bin/kubectl
```

Install Kops
```
brew update && brew install --HEAD kops
```

Install AWS CLI
```
brew install awscli
aws configure
```

Create a new IAM group for kops with the necessary permissions
```
aws iam create-group --group-name kops

export arns="
arn:aws:iam::aws:policy/AmazonEC2FullAccess
arn:aws:iam::aws:policy/AmazonRoute53FullAccess
arn:aws:iam::aws:policy/AmazonS3FullAccess
arn:aws:iam::aws:policy/IAMFullAccess
arn:aws:iam::aws:policy/AmazonVPCFullAccess"

for arn in $arns; do aws iam attach-group-policy --policy-arn "$arn" --group-name kops; done

aws iam create-user --user-name kops

aws iam add-user-to-group --user-name kops --group-name kops

aws iam create-access-key --user-name kops
```

### Update Route53

```
ID=$(uuidgen) && aws route53 create-hosted-zone --name subdomain.benmcphail.info --caller-reference $ID
```

To see your file:
```
aws route53 list-hosted-zones
```

Next make a `domain.json` file:

```
{
  "Comment": "Create a subdomain NS record in the parent domain",
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "subdomain.benmcphail.info",
        "Type": "NS",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "ns-1.awsdns-1.co.uk"
          },
          {
            "Value": "ns-2.awsdns-2.org"
          },
          {
            "Value": "ns-3.awsdns-3.com"
          },
          {
            "Value": "ns-4.awsdns-4.net"
          }
        ]
      }
    }
  ]
}
```

Apply the SUBDOMAIN NS records to the PARENT hosted zone.

```
aws route53 change-resource-record-sets \
 --hosted-zone-id <parent-zone-id> \
 --change-batch file://subdomain.json
```
Where you can get your parent zone id by:
```
brew install jq
aws route53 list-hosted-zones | jq '.HostedZones[] | select(.Name=="benmcphail.info.") | .Id'
```

Now traffic to *.benmcphail.info will be routed to the correct subdomain hosted zone in Route53.

### Update route 53

```
aws s3api create-bucket --bucket benmcphail-info-state-store --region us-east-1
## and version it
aws s3api put-bucket-versioning --bucket benmcphail-info-state-store  --versioning-configuration Status=Enabled
```

### Lets create the cluster!!!

```
vi ~/.bash_profile
### INSIDE .bash_profile
export AWS_ACCESS_KEY_ID=KEY
export AWS_SECRET_ACCESS_KEY=SECRET_KEY
export NAME=samplecluster.benmcphail.info
export KOPS_STATE_STORE=s3://benmcphail-info-state-store
### END
kops create cluster \
    --zones us-west-2a \
    ${NAME}
```

^ if this screws up due to permissions, you may need to setup a public key:
- Generation a public key:
```
ssh-keygen -y -f yourprivatekey.pem  
```
- Copy the outputting text
- log into AWS console and navigate to IAM User, specificly `kops` > `Security Credentials`
- Click `Upload SSH Public Key` and past in your key
- Then run:

```
create cluster --zones us-west-2a ${NAME} --ssh-public-key=/SuperSecretPublicKeyLocation/pubKey.pub
```
BOOMW! You have you're own cluster!

...

Note: Clusters are expensive, so you might want to delete it soon if it is a test cluster
```
kops delete cluster CLUSTERNAME [--yes]
```
