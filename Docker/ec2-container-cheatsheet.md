# EC2 Container Cheatsheet

* Create a user

* Create a user group and provide them with `AdministratorAccess` (only for testing)

![alt text](https://s3-us-west-2.amazonaws.com/github-screenshots-bm/Screen+Shot+2017-02-08+at+10.01.10+pm.png)

* Select the Group and add your newly created user

![alt text](https://s3-us-west-2.amazonaws.com/github-screenshots-bm/Screen+Shot+2017-02-08+at+10.05.33+pm.png)

This will give them admin access, so they could use the cmd line with the key downloaded but from a web side, they will not be able to sign in/do anything.

## Instance key pair

* Go to EC2
* On the LHS: Network Services -> Key pairs
* Create a keypair `ecsadmin-key-pair-us-oregon`
* Saving this will download the `.pem` file

Two methods to manage your key pair.

#### Method 1

* Place your `.pem` file in a safe place on your machine
* cd into that file
* Type the following:
```
ssh-agent-bash
# This runs the ssh agent in the background
ssh-add ecsadmin-key-pair-us-oregon.pem
# Output: Identity added: ecsadmin-key-pair-us-oregon.pem (ecsadmin-key-pair-us-oregon.pem)
# This adds the pem file to the agent
ssh -i ecsadmin-key-pair-us-oregon.pem ec2-user@PUBLIC_IP
## This will ssh you into the instance
```

#### Method 2

* Place your `.pem` file into `/Users/YOUR_USER/.ssh/id_rsa`
* Go up one directory `cd ..`
* Add the following to the `config` file and save/exit:
```
host ec2container
  Hostname ec2-00-000-000-000.us-xxx-0.compute.amazonaws.com
  User ec2-user
  IdentityFile ~/.ssh/id_rsa/ecsadmin-key-pair-us-oregon.pem
```
* Now you can access the container my typing `ssh ec2container`.

## Create a VPC for a Cluster

* Go to `VPC` in aws
* Click `Create VPC`
* Make Name: `ECS_VPC`
* Make IPv4 CIDR block*: `10.17.0.0/16`
* Tenancy: Default (if it is `dedicated` no one else can use that block and it costs you money)
* Click `Yes, Create`

## Setup a Security Group for your VPC

* Go to EC2 > Security Groups
* Click `Create Security Group`, name it `esc-sg-org` or whatever
* Apply it to our new VPC `ECS_VPC`
* Set the inbounds to the following:
![alt text](https://s3-us-west-2.amazonaws.com/github-screenshots-bm/sample-security-group.png)
* Set the outbounds to SSH, HTTP and HTTPS to be anywhere (we can change it before we hit produciton)

## Install/configure AWS CLI

`brew install awscli`











