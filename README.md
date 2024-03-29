# iam-assumable-roles

Creates predefined IAM roles (admin, poweruser and readonly) which can be assumed by trusted resources.

Trusted resources can be any [IAM ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns) - typically, AWS accounts and users.

```
module "iam-roles" {
  source = "git@github.com:kabisa/terraform-iam-assumable-roles.git?ref=[version]"

  trusted_role_arns = [
    "arn:aws:iam::${local.dovetail-iam}:root",
    "arn:aws:iam::${local.kabisa-iam}:root",
  ]

  create_ci_cd_role = true

  trusted_roles_ci_cd = [
    "arn:aws:iam::{[account-id]}:role/github_actions_role",
  ]

  ci_cd_role_managed_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]

  ci_cd_role_inline_policies = {
    "example_inline_policy" : data.aws_iam_policy_document.example.json,
    "example2" : data.aws_iam_policy_document.example2.json
  }

  create_admin_role     = true
  create_poweruser_role = true
  create_readonly_role  = true
}

data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["ssm:*", "ec2:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "example2" {
  statement {
    actions   = ["s3:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin_role_name | IAM role with admin access | string | `admin` | no |
| admin_role_path | Path of admin IAM role | string | `/` | no |
| admin_role_policy_arn | Policy ARN to use for admin role | string | `arn:aws:iam::aws:policy/AdministratorAccess` | no |
| admin_role_requires_mfa | Whether admin role requires MFA | string | `true` | no |
| create_admin_role | Whether to create admin role | string | `false` | no |
| create_poweruser_role | Whether to create poweruser role | string | `false` | no |
| create_readonly_role | Whether to create readonly role | string | `false` | no |
| max_session_duration | Maximum CLI/API session duration in seconds between 3600 and 43200 | string | `3600` | no |
| mfa_age | Max age of valid MFA (in seconds) for roles which require MFA | string | `86400` | no |
| poweruser_role_name | IAM role with poweruser access | string | `poweruser` | no |
| poweruser_role_path | Path of poweruser IAM role | string | `/` | no |
| poweruser_role_policy_arn | Policy ARN to use for admin role | string | `arn:aws:iam::aws:policy/PowerUserAccess` | no |
| poweruser_role_requires_mfa | Whether poweruser role requires MFA | string | `true` | no |
| readonly_role_name | IAM role with readonly access | string | `readonly` | no |
| readonly_role_path | Path of readonly IAM role | string | `/` | no |
| readonly_role_policy_arn | Policy ARN to use for readonly role | string | `arn:aws:iam::aws:policy/ReadOnlyAccess` | no |
| readonly_role_requires_mfa | Whether readonly role requires MFA | string | `true` | no |
| trusted_role_arns | ARNs of AWS entities who can assume these roles | string | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| admin_iam_role_arn | Admin |
| admin_iam_role_name | Name of admin IAM role |
| admin_iam_role_path | Path of admin IAM role |
| admin_iam_role_requires_mfa | Whether admin IAM role requires MFA |
| poweruser_iam_role_arn | Poweruser |
| poweruser_iam_role_name | Name of poweruser IAM role |
| poweruser_iam_role_path | Path of poweruser IAM role |
| poweruser_iam_role_requires_mfa | Whether poweruser IAM role requires MFA |
| readonly_iam_role_arn | Readonly |
| readonly_iam_role_name | Name of readonly IAM role |
| readonly_iam_role_path | Path of readonly IAM role |
| readonly_iam_role_requires_mfa | Whether readonly IAM role requires MFA |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
