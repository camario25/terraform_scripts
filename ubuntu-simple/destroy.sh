#!/bin/bash
cp ~/DevOps/secrets/terraform.tfvars.asc .
gpg1 --decrypt --output terraform.tfvars terraform.tfvars.asc
terraform destroy
sleep 60s
rm ./terraform.tfvars*
