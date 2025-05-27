resource "aws_iam_policy" "read_secret_policy" {
  name = "fh-read-secret-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "secretsmanager:GetSecretValue"
      ],
      Resource = aws_secretsmanager_secret.my_secret.arn
    }]
  })
}

resource "aws_iam_policy" "update_secret_policy" {
  name = "fh-update-secret-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:PutSecretValue",
          "secretsmanager:UpdateSecret"
        ],
        Resource = aws_secretsmanager_secret.my_secret.arn
      }
    ]
  })
}

resource "aws_iam_policy" "allow_assume_reader_role" {
  name = "fh-dev-can-assume-read-secret-role"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = "sts:AssumeRole",
      Resource = aws_iam_role.app_reader_role.arn
    }]
  })
}
