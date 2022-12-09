resource "aws_iam_role" "sla_reporter" {
  count = var.create_sla_reporter_role ? 1 : 0

  name               = "SLAReporter"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "sla_reporter" {
  count = var.create_sla_reporter_role ? 1 : 0

  role       = aws_iam_role.sla_reporter[count.index].name
  policy_arn = aws_iam_policy.sla_reporter[count.index].arn
}

resource "aws_iam_policy" "sla_reporter" {
  count = var.create_sla_reporter_role ? 1 : 0

  name   = "SLAReporter"
  policy = data.aws_iam_policy_document.sla_reporter.json
}

data "aws_iam_policy_document" "sla_reporter" {
  statement {
    resources = ["*"]
    actions   = ["ce:GetCostAndUsage"]
  }
}
