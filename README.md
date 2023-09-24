# Terraform AWS Project

## Overview

This project deploys a web application infrastructure using AWS services such as S3, CloudFront, IAM, and CloudWatch. Terraform is used for infrastructure automation.

## Prerequisites

- AWS Account
- AWS CLI installed and configured
- Terraform v1.x installed

## Version Information

- Terraform Version: `~> 1.x`
- AWS Provider Version: `~> 3.0`

## Getting Started

1. **Clone the repository**
    ```bash
    git clone <repository_url>
    ```

2. **Navigate to the project directory**
    ```bash
    cd <project_directory>
    ```

3. **Initialize Terraform**
    ```bash
    terraform init
    ```

4. **Validate the Terraform Files**
    ```bash
    terraform validate
    ```

5. **Create an Execution Plan**
    ```bash
    terraform plan
    ```

6. **Apply the Terraform Configuration**
    ```bash
    terraform apply
    ```

## Commands

- `terraform init`: Initialize a new or existing Terraform configuration
- `terraform validate`: Validates the Terraform files for any syntax errors
- `terraform plan`: Shows an execution plan and indicates what actions Terraform will take to achieve the desired state
- `terraform apply`: Builds or changes infrastructure according to the plan
- `terraform destroy`: Destroys Terraform-managed infrastructure

## Cleanup

To destroy all resources created by this project:

```bash
terraform destroy
