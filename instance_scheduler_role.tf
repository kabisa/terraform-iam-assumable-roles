# Instance Scheduler 

resource "aws_iam_role" "this" {
  count = var.create_instance_scheduler_role ? 1 : 0
  name  = "instance_scheduler_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.instance_scheduler_trusted_account_id}:root",
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "this" {
  count = var.create_instance_scheduler_role ? 1 : 0
  name  = "instance_scheduler_policy"
  role  = aws_iam_role.this[0].id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ec2:DescribeInstances",
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:ModifyInstanceAttribute",
                "ec2:CreateTags",
                "ec2:DeleteTags"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "rds:DescribeDBInstances",
                "rds:DescribeDBSnapshots",
                "rds:StartDBInstance",
                "rds:StopDBInstance",
                "rds:AddTagsToResource",
                "rds:RemoveTagsFromResource",
                "rds:DeleteDBSnapshot"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "tag:GetResources"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        }
    ]
}
EOF

}

