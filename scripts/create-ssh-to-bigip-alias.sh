#!/bin/bash

# export Bigip1ManagementEipAddress=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=Big-IP1: BIGIP-Across-Az-Cluster-2nic-PAYG" --query "Reservations[*].Instances[*].PublicIpAddress" --output text)
# export Bigip2ManagementEipAddress=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=Big-IP2: BIGIP-Across-Az-Cluster-2nic-PAYG" --query "Reservations[*].Instances[*].PublicIpAddress" --output text)
export Bigip1ManagementEipAddress=$(terraform output -json BIGIP-Across-Az-Cluster-2nic-PAYG_outputs | jq -r '.Bigip1ManagementEipAddress')
export Bigip2ManagementEipAddress=$(terraform output -json BIGIP-Across-Az-Cluster-2nic-PAYG_outputs | jq -r '.Bigip2ManagementEipAddress')
alias bigip1='ssh -i ./MyKeyPair-student@f5lab.dev.pem admin@${Bigip1ManagementEipAddress}'
alias bigip2='ssh -i ./MyKeyPair-student@f5lab.dev.pem admin@${Bigip2ManagementEipAddress}'
