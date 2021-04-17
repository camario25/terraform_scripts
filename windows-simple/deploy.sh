#!/bin/bash
cp ~/DevOps/secrets/terraform.tfvars.asc .
cp ~/.ssh/id_rsa ./ah-devops
cp ~/.ssh/id_rsa.pub ./ah-devops.pub
gpg1 --decrypt --output terraform.tfvars terraform.tfvars.asc
terraform plan
terraform apply
sleep 60s
rm ./terraform.tfvars* ./ah-devops*
