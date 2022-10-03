# Role
resource "aws_iam_role" "role_for_lambda" {
  name = "role_for_lambda"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# Policy
resource "aws_iam_policy" "policy" {
  name = "start-stop-rds"
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "rds:StartDBCluster",
          "rds:StopDBCluster",
          "rds:ListTagsForResource",
          "rds:DescribeDBInstances",
          "rds:StopDBInstance",
          "rds:DescribeDBClusters",
          "rds:StartDBInstance"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

data "aws_iam_policy" "basic" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.role_for_lambda.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role_policy_attachment" "basic" {
  role       = aws_iam_role.role_for_lambda.name
  policy_arn = data.aws_iam_policy.basic.arn
}






