terraform {
  source = "github.com/insight-infrastructure/terraform-aws-cloudfront-static-site"

  extra_arguments "custom_vars" {
    commands = get_terraform_commands_that_need_vars()
  }
}

inputs = {
  root_domain_name = "robc.io"
}

remote_state {
  backend = "s3"

  config = {
    encrypt = true
    region = "us-east-1"
    key = "robc.xyz/blog/terraform.tfstate"
    bucket = "terraform-states-${get_aws_account_id()}"
    dynamodb_table = "terraform-locks-${get_aws_account_id()}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "skip"
  contents =<<-EOF
provider "aws" {
  region = "us-east-1"
  skip_get_ec2_platforms     = true
  skip_metadata_api_check    = true
  skip_region_validation     = true
  skip_requesting_account_id = true
}

terraform {
  backend "s3" {}
}
EOF
}
