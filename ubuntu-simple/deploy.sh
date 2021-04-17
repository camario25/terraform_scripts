#!/bin/bash
cp ~/DevOps/secrets/terraform.tfvars.asc .
gpg1 --decrypt --output terraform.tfvars terraform.tfvars.asc
terraform plan
terraform apply
sleep 60s
rm ./terraform.tfvars*
