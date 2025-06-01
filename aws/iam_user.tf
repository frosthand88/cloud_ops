resource "aws_iam_user" "local_dev_user" {
  name = "fh-local-dev"
}

resource "aws_iam_access_key" "local_dev_user_key" {
  user = aws_iam_user.local_dev_user.name
}
