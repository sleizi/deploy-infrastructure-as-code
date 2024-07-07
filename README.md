# Udagram Infrastructure Deployment

This project deploys an Instagram clone called Udagram to AWS using CloudFormation templates.

## Project Structure

- `network.yml`: CloudFormation template for network infrastructure
- `network-parameters.json`: Parameters file for the network template
- `udagram.yml`: CloudFormation template for Udagram application infrastructure
- `udagram-parameters.json`: Parameters file for the Udagram template
- `create.sh`: Script to create the infrastructure
- `delete.sh`: Script to delete the infrastructure

## Prerequisites

- AWS CLI installed and configured
- IAM role with sufficient permissions to create and delete the resources
- `jq` installed for processing JSON in the scripts

## Instructions

### Creating the Infrastructure

1. Run the `create.sh` script to create the infrastructure:

    ```bash
    ./create.sh
    ```

2. Wait for the stacks to be created. The `create.sh` script will create the network stack first and then use its output to create the Udagram stack.

3. Once the stacks are created, you can access the Udagram application using the Load Balancer DNS name. The DNS name can be found in the CloudFormation stack outputs.

### Deleting the Infrastructure

1. Run the `delete.sh` script to delete the infrastructure:

    ```bash
    ./delete.sh
    ```

2. Wait for the stacks to be deleted. The `delete.sh` script will delete the Udagram stack first and then delete the network stack.

### Notes

- Ensure that the S3 bucket is empty before deleting the Udagram stack.
- Update the `ami-0d5d9d301c853a04a` value in the `udagram.yml` template with the latest Ubuntu 22 AMI ID for your region.

## Outputs

- `LoadBalancerDNSName`: The DNS name of the application load balancer.
