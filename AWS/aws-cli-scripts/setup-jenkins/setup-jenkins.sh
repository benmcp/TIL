#!/usr/bin/env bash

################
#   Variables
################
source .env

################
#   Functions
################

function checkRole() {
  roles=`aws iam list-roles | jq '.Roles'`

  check=`echo "$roles" | jq --arg roleName "${roleName}" '.[] | select(.RoleName==$roleName)'`

  if [[ $check =~ [a-zA-Z] ]]; then
    echo true
  else
    echo false
  fi
}

function createRole() {
  roleExists=`checkRole $name`

  if $roleExists; then
    echo 'role exists'
  else
    createRole=`aws iam create-role\
      --role-name ${roleName}\
      --assume-role-policy-document file://${trustPolicy}`
    echo $createRole
    attachPolicy=`aws iam attach-role-policy \
      --policy-arn arn:aws:iam::aws:policy/${rolePolicy} \
      --role-name ${roleName}`
    echo $attachPolicy

    createProfile=`aws iam create-instance-profile \
      --instance-profile-name ${roleName}`
    echo $createProfile

    addProfileToRole=`aws iam add-role-to-instance-profile \
      --instance-profile-name ${roleName} \
      --role-name ${roleName}`
    echo $addProfileToRole
  fi
}

function createEC2() {
  launchInstance=`aws ec2 run-instances \
    --image-id ${imageId} \
    --instance-type t2.micro \
    --user-data file://${instanceSetup} \
    --security-group-ids ${securityGroupID} \
    --iam-instance-profile Name=${roleName} \
    --count 1 \
    --key-name ${keyPair}`

  instanceId=`echo "$launchInstance" | jq .Instances[0].InstanceId --raw-output`
  # ipAddress=`echo "$launchInstance" | jq .Instances[0].PublicIpAddress  --raw-output`
  addTag=`aws ec2 create-tags\
    --resources ${imageId} ${instanceId}\
    --tags Key=Name,Value=${roleName}`

  check=`aws ec2 describe-instances \
    --instance-ids ${instanceId}`
  # echo $check

  ipAddress=`aws ec2 describe-instances \
    --instance-ids ${instanceId} \
    | jq '.Reservations[0].Instances[0].PublicIpAddress' --raw-output`

  echo 'Instance created:' $roleName
  echo 'IP Address: ' $ipAddress
}


terminateInstance() {
  instances=`aws ec2 describe-instances`
  instance=`echo "$instances" | jq\
    --arg roleName "${roleName}"\
    '.Reservations[] |\
    select((.Instances[0].Tags[0].Value==$roleName) and (.Instances[0].State.Name=="running"))'  --raw-output`

  instanceIDs=`echo "$instance" | jq .Instances[0].InstanceId   --raw-output`

  echo "Terminating the following instance(s)"
  echo $instanceIDs

  terminate=`aws ec2 terminate-instances --instance-ids ${instanceIDs}`
}

################
#   Main
################

if [[ $1 == '-terminate' ]]; then
  terminateInstance
else
  # Create Role
  createRole

  # Create Jenkins EC2
  createEC2
fi
