#!/bin/bash

# Create Network Stack
aws cloudformation create-stack --stack-name network-stack --template-body file://network.yml --parameters file://network-parameters.json

# Wait for Network Stack to be created
aws cloudformation wait stack-create-complete --stack-name network-stack

# Get the Network Stack output values
VPCId=$(aws cloudformation describe-stacks --stack-name network-stack --query "Stacks[0].Outputs[?OutputKey=='VPCId'].OutputValue" --output text)
PublicSubnet1Id=$(aws cloudformation describe-stacks --stack-name network-stack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet1Id'].OutputValue" --output text)
PublicSubnet2Id=$(aws cloudformation describe-stacks --stack-name network-stack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet2Id'].OutputValue" --output text)
PrivateSubnet1Id=$(aws cloudformation describe-stacks --stack-name network-stack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text)
PrivateSubnet2Id=$(aws cloudformation describe-stacks --stack-name network-stack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text)

# Create Udagram Stack
aws cloudformation create-stack --stack-name udagram-stack --template-body file://udagram.yml --parameters ParameterKey=VPCId,ParameterValue=$VPCId ParameterKey=PublicSubnet1Id,ParameterValue=$PublicSubnet1Id ParameterKey=PublicSubnet2Id,ParameterValue=$PublicSubnet2Id ParameterKey=PrivateSubnet1Id,ParameterValue=$PrivateSubnet1Id ParameterKey=PrivateSubnet2Id,ParameterValue=$PrivateSubnet2Id
