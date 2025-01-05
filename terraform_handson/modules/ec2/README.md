
# Terraform AWS EC2 Instance

This Terraform configuration creates an Amazon Web Services (AWS) EC2 instance. The module is designed to be reusable and customizable for deploying virtual machines with specified attributes such as instance type, AMI, key pair, and security groups.

## Prerequisites

1. **Terraform**: Ensure Terraform is installed on your local machine. You can download it from the [official Terraform website](https://developer.hashicorp.com/terraform/downloads).
2. **AWS Account**: You must have an active AWS account and appropriate credentials.
3. **AWS CLI**: (Optional) Install the AWS CLI and configure it with your credentials using `aws configure`.

## Features

- Creates an AWS EC2 instance with a specified AMI and instance type.
- Supports tagging resources for better organization.
- Enables configuration of key pair, security groups, and additional instance settings.
- Outputs key instance details such as public IP and instance ID.

## File Structure

```plaintext
.
├── main.tf              # Main Terraform configuration file
├── variables.tf         # Input variable definitions
├── outputs.tf           # Outputs from the Terraform configuration
├── terraform.tfvars     # Values for input variables (user-specific)
└── README.md            # Project documentation
```

## Variables

The `variables.tf` file defines the following inputs:

| Variable            | Type        | Description                                         | Default          |
|---------------------|-------------|-----------------------------------------------------|------------------|
| `instance_type`     | `string`    | Type of EC2 instance (e.g., `t2.micro`).           | `t2.micro`       |
| `ami_id`            | `string`    | Amazon Machine Image (AMI) ID to launch the EC2.   | (Required)       |
| `key_name`          | `string`    | Name of the key pair for SSH access.               | (Required)       |
| `security_groups`   | `list(string)` | List of security group names or IDs.             | `["default"]`    |
| `tags`              | `map(string)` | Tags to associate with the instance.             | `{}`             |

Example `terraform.tfvars` file:
```hcl
instance_type    = "t2.micro"
ami_id           = "ami-0abcdef1234567890"
key_name         = "my-key-pair"
security_groups  = ["sg-0a1b2c3d4e5f6g7h8"]
tags = {
  Name        = "MyEC2Instance"
  Environment = "Development"
}
```

## Outputs

The `outputs.tf` file provides the following:

| Output        | Description                              |
|---------------|------------------------------------------|
| `instance_id` | The ID of the created EC2 instance.      |
| `public_ip`   | The public IP address of the instance.   |
| `private_ip`  | The private IP address of the instance.  |

## Usage

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform**:
   Initialize the Terraform working directory and download necessary provider plugins:
   ```bash
   terraform init
   ```

3. **Preview the changes**:
   Run a plan to see the infrastructure changes that will be applied:
   ```bash
   terraform plan
   ```

4. **Apply the configuration**:
   Apply the configuration to create the resources:
   ```bash
   terraform apply
   ```
   Confirm the prompt with `yes`.

5. **Destroy resources**:
   To tear down the created resources:
   ```bash
   terraform destroy
   ```

## Notes

- Ensure that your AWS credentials are properly configured. Terraform will use them to authenticate with AWS.
- Use the `terraform.tfvars` file to specify environment-specific values.
- Be cautious with resource usage to avoid unexpected costs in your AWS account.

## Best Practices

- Use remote state storage (e.g., S3) for collaboration.
- Manage secrets securely, avoiding hardcoding them in configuration files.
- Review the AWS Free Tier limits to avoid unexpected charges.

## Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)

---

*Happy Coding in IaC!*
