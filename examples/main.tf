provider "aws" {
  region = "eu-west-1"
}

######################
# IAM assumable roles
######################
module "iam_assumable_roles" {
  source = "github.com/kabisa/terraform-iam-assumable-roles"

  trusted_role_arns = [
    "arn:aws:iam::307990089504:root",
    "arn:aws:iam::835367859851:user/anton",
  ]

  create_admin_role = true

  create_poweruser_role = true
  poweruser_role_name   = "developer"

  create_readonly_role       = true
  readonly_role_requires_mfa = false

  create_nagios_role                      = true
  nagios_role_arn                         = "arn:aws:iam::117596536646:role/nagios-ec2-role"

  create_instance_scheduler_role          = true
  instance_scheduler_trusted_account_id   = "366117596546"
}
