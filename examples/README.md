# IAM assumable roles example

__Thanks to antonbabenko__

Configuration in this directory creates several IAM roles which can be assumed from a defined list of [IAM ARNs](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns).

# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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
| readonly_iam_role_requires_mfa | Whether readonly IAM role requires MFA |
| nagios_role_arn | ARN of principal which assumes nagios role |
| instance_scheduler_trusted_account_id | AWS account id where the master instance scheduler is running |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
