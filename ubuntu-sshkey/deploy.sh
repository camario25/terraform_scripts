#!/bin/bash
cp ~/DevOps/secrets/terraform.tfvars.asc .
cp ~/.ssh/id_rsa ./tf-ubuntu
cp ~/.ssh/id_rsa.pub ./tf-ubuntu.pub
gpg1 --decrypt --output terraform.tfvars terraform.tfvars.asc
terraform plan
terraform apply
sleep 60s
rm ./terraform.tfvars* ./tf-ubuntu*
