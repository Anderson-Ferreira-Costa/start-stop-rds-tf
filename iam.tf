# Role
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role_for_lambda" {
  name = "role_for_lambda"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# Policy
data "aws_iam_policy_document" "start-stop-rds" {
  statement {
    actions   = [
      "rds:StartDBCluster",
      "rds:StopDBCluster",
      "rds:ListTagsForResource",
      "rds:DescribeDBInstances",
      "rds:StopDBInstance",
      "rds:DescribeDBClusters",
      "rds:StartDBInstance",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy" {
  name   = "start-stop-rds"
  path   = "/"
  policy = data.aws_iam_policy_document.start-stop-rds.json
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.role_for_lambda.name
  policy_arn = aws_iam_policy.policy.arn
}
