resource "aws_iam_role_policy_attachment" "attach_read" {
  role       = aws_iam_role.app_reader_role.name
  policy_arn = aws_iam_policy.read_secret_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_write" {
  role       = aws_iam_role.cicd_writer_role.name
  policy_arn = aws_iam_policy.update_secret_policy.arn
}

resource "aws_iam_user_policy_attachment" "dev_user_attach_assume_role" {
  user       = aws_iam_user.local_dev_user.name
  policy_arn = aws_iam_policy.allow_assume_reader_role.arn
}
