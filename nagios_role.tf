# Nagios

resource "aws_iam_role" "nagios_iam_role" {
  count = var.create_nagios_role ? 1 : 0

  name               = "nagios_cloudwatch_read_access_role"
  assume_role_policy = data.aws_iam_policy_document.nagios_policy_document[0].json
}

data "aws_iam_policy_document" "nagios_policy_document" {
  count = var.create_nagios_role ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = var.nagios_role_arn
    }
  }
}

resource "aws_iam_role_policy_attachment" "nagios_cloudwatch_read" {
  count = var.create_nagios_role ? 1 : 0

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
  role       = aws_iam_role.nagios_iam_role[0].name
}

resource "aws_iam_role_policy_attachment" "nagios_cloudwatch_budget_read" {
  count = var.create_nagios_budget_role ? 1 : 0

  policy_arn = "arn:aws:iam::aws:policy/AWSBudgetsReadOnlyAccess"
  role       = aws_iam_role.nagios_iam_role[0].name
}