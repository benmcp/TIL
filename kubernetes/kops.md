# Getting Started

## Install kops

Before we can bring up the cluster we need to [install the CLI tool](install.md) `kops`.

## Install kubectl

In order to control Kubernetes clusters we need to [install the CLI tool](install.md) `kubectl`.

#### Other Platforms

* [Kubernetes Latest Release](https://github.com/kubernetes/kubernetes/releases/latest)

* [Installation Guide](http://kubernetes.io/docs/user-guide/prereqs/)

## Setup your environment

### AWS

In order to correctly prepare your AWS account for `kops`, we require you to
install the AWS CLI tools, and have API credentials for an account that has
the permissions to create a new IAM account for `kops` later in the guide.


Once you've [installed the AWS CLI tools](install.md) and have correctly setup
your system to use the official AWS methods of registering security credentials
as [defined here](https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials) we'll be ready to run `kops`, as it uses the Go AWS SDK.

#### Setup IAM user

In order to build clusters within AWS we'll create a dedicated IAM user for
`kops`.  This user requires API credentials in order to use `kops`.  Create
the user, and credentials, using the [AWS console](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console).

The `kops` user will require the following IAM permissions to function properly:

```
AmazonEC2FullAccess
AmazonRoute53FullAccess
AmazonS3FullAccess
IAMFullAccess
AmazonVPCFullAccess
```

You can create the kops IAM user from the command line using the following:

```bash
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

You should record the SecretAccessKey and AccessKeyID in the returned JSON
output, and then use them below:

```bash
# configure the aws client to use your new IAM user
aws configure           # Use your new access and secret key here
aws iam list-users      # you should see a list of all your IAM users here

# Because "aws configure" doesn't export these vars for kops to use, we export them now
export AWS_ACCESS_KEY_ID=<access key>
export AWS_SECRET_ACCESS_KEY=<secret key>
```

## Configure DNS

In order to build a Kubernetes cluster with `kops`, we need to prepare
somewhere to build the required DNS records.  There are three scenarios
below and you should choose the one that most closely matches your AWS
situation.

### Scenario 1a: A Domain purchased/hosted via AWS

If you bought your domain with AWS, then you should already have a hosted zone
in Route53.  If you plan to use this domain then no more work is needed.

In this example you own `example.com` and your records for Kubernetes would
look like `etcd-us-east-1c.internal.clustername.example.com`

### Scenario 1b: A subdomain under a domain purchased/hosted via AWS

In this scenario you want to contain all kubernetes records under a subdomain
of a domain you host in Route53.  This requires creating a second hosted zone
in route53, and then setting up route delegation to the new zone.

In this example you own `example.com` and your records for Kubernetes would
look like `etcd-us-east-1c.internal.clustername.kubernetes.example.com`

This is copying the NS servers of your **SUBDOMAIN** up to the **PARENT**
domain in Route53.  To do this you should:

* Create the subdomain, and note your **SUBDOMAIN** name servers (If you have
  already done this you can also [get the values](ns.md))

```bash
ID=$(uuidgen) && aws route53 create-hosted-zone --name subdomain.example.com --caller-reference $ID | jq .DelegationSet.NameServers
```

* Note your **PARENT** hosted zone id

```bash
# Note: This example assumes you have jq installed locally.
aws route53 list-hosted-zones | jq '.HostedZones[] | select(.Name=="example.com.") | .Id'
```

* Create a new JSON file with your values (`subdomain.json`)

Note: The NS values here are for the **SUBDOMAIN**

```
{
  "Comment": "Create a subdomain NS record in the parent domain",
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "subdomain.example.com",
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

* Apply the **SUBDOMAIN** NS records to the **PARENT** hosted zone.

```
aws route53 change-resource-record-sets \
 --hosted-zone-id <parent-zone-id> \
 --change-batch file://subdomain.json
```

Now traffic to `*.example.com` will be routed to the correct subdomain hosted zone in Route53.

### Scenario 2: Setting up Route53 for a domain purchased with another registrar

If you bought your domain elsewhere, and would like to dedicate the entire domain to AWS you should follow the guide [here](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html)

### Scenario 3: Subdomain for clusters in route53, leaving the domain at another registrar

If you bought your domain elsewhere, but **only want to use a subdomain in AWS
Route53** you must modify your registrar's NS (NameServer) records.  We'll create
a hosted zone in Route53, and then migrate the subdomain's NS records to your
other registrar.

You might need to grab [jq](https://github.com/stedolan/jq/wiki/Installation)
for some of these instructions.

* Create the subdomain, and note your name servers (If you have already done
  this you can also [get the values](ns.md))

```bash
ID=$(uuidgen) && aws route53 create-hosted-zone --name subdomain.kubernetes.com --caller-reference $ID | jq .DelegationSet.NameServers
```

* You will now go to your registrars page and log in. You will need to create a
  new **SUBDOMAIN**, and use the 4 NS records listed above for the new
  **SUBDOMAIN**. This **MUST** be done in order to use your cluster. Do **NOT**
  change your top level NS record, or you might take your site offline.

* Information on adding NS records with
  [Godaddy.com](https://www.godaddy.com/help/set-custom-nameservers-for-domains-registered-with-godaddy-12317)
* Information on adding NS records with [Google Cloud
  Platform](https://cloud.google.com/dns/update-name-servers)

#### Using Public/Private DNS (Kops 1.5+)

By default the assumption is that NS records are publically available.  If you
require private DNS records you should modify the commands we run later in this
guide to include:

```
kops create cluster --dns private $NAME
```

## Testing your DNS setup

You should now able to dig your domain (or subdomain) and see the AWS Name
Servers on the other end.

```bash
dig ns subdomain.example.com
```

Should return something similar to:

```
;; ANSWER SECTION:
subdomain.example.com.        172800  IN  NS  ns-1.awsdns-1.net.
subdomain.example.com.        172800  IN  NS  ns-2.awsdns-2.org.
subdomain.example.com.        172800  IN  NS  ns-3.awsdns-3.com.
subdomain.example.com.        172800  IN  NS  ns-4.awsdns-4.co.uk.
```

This is a critical component of setting up clusters. If you are experiencing
problems with the Kubernetes API not coming up, chances are something is wrong
with the clusters DNS.

**Please DO NOT MOVE ON until you have validated your NS records!**

## Cluster State storage

In order to store the state of your cluster, and the representation of your
cluster, we need to create a dedicated S3 bucket for `kops` to use.  This
bucket will become the source of truth for our cluster configuration.  In
this guide we'll call this bucket `example-com-state-store`, but you should
add a custom prefix as bucket names need to be unique.

We recommend keeping the creation of this bucket confined to us-east-1,
otherwise more work will be required.

```bash
aws s3api create-bucket --bucket prefix-example-com-state-store --region us-east-1
```

Note: We **STRONGLY** recommend versioning your S3 bucket in case you ever need
to revert or recover a previous state store.

```bash
aws s3api put-bucket-versioning --bucket prefix-example-com-state-store  --versioning-configuration Status=Enabled
```

### Sharing an S3 bucket across multiple accounts

If you configure a single S3 bucket to maintain kops state for clusters across
multiple accounts, you may want to override the object ACLs which kops places
on the state files.

To do this you should set the environment variable `KOPS_STATE_S3_ACL` to the
preferred object ACL, for example `bucket-owner-full-control`.

For available canned ACLs please consult [Amazon's S3
documentation](http://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl).

# Creating your first cluster

## Prepare local environment

We're ready to start creating our first cluster!  Let's first setup a few
environment variables to make this process easier.

```bash
export NAME=myfirstcluster.example.com
export KOPS_STATE_STORE=s3://prefix-example-com-state-store
```

Note: You don’t have to use environmental variables here. You can always define
the values using the –name and –state flags later.

## Create cluster configuration

We will need to note which availability zones are available to us. In this
example we will be deploying our cluster to the us-west-2 region.

```bash
aws ec2 describe-availability-zones --region us-west-2
```

Below is a create cluster command.  We'll use the most basic example possible,
with more verbose examples in [advanced creation](advanced_create.md).  The
below command will generate a cluster configuration, but not start building it.

```bash
kops create cluster \
    --zones us-west-2a \
    ${NAME}
```

All instances created by `kops` will be built within ASG (Auto Scaling Groups),
which means each instance will be automatically monitored and rebuilt by AWS if
it suffers any failure.

## Customize Cluster Configuration

Now we have a cluster configuration, we can look at every aspect that defines
our cluster by editing the description.

```bash
kops edit cluster ${NAME}
```

This opens your editor (as defined by $EDITOR) and allows you to edit the
configuration.  The configuration is loaded from the S3 bucket we created
earlier, and automatically updated when we save and exit the editor.

We'll leave everything set to the defaults for now, but the rest of the `kops`
documentation covers additional settings and configuration you can enable.

## Build the Cluster

Now we take the final step of actually building the cluster.  This'll take a
while.  Once it finishes you'll have to wait longer while the booted instances
finish downloading Kubernetes components and reach a "ready" state.

```bash
kops update cluster ${NAME} --yes
```

## Use the Cluster

Remember when you installed `kubectl` earlier? The configuration for your
cluster was automatically generated and written to `~/.kube/config` for you!

A simple Kubernetes API call can be used to check if the API is online and
listening. Let's use `kubectl` to check the nodes.

```bash
kubectl get nodes
```

You will see a list of nodes that should match the `--zones` flag defined
earlier. This is a great sign that your Kubernetes cluster is online and
working.

Also `kops` ships with a handy validation tool that can be ran to ensure your
cluster is working as expected.

```bash
kops validate cluster
```

You can look at all the system components with the following command.

```
kubectl -n kube-system get po
```
