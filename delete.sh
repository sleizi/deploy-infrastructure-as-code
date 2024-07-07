#!/bin/bash

# Delete Udagram Stack
aws cloudformation delete-stack --stack-name udagram-stack

# Wait for Udagram Stack to be deleted
aws cloudformation wait stack-delete-complete --stack-name udagram-stack

# Delete Network Stack
aws cloudformation delete-stack --stack-name network-stack

# Wait for Network Stack to be deleted
aws cloudformation wait stack-delete-complete --stack-name network-stack
