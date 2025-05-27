resource "aws_secretsmanager_secret" "my_secret" {
  name        = "MyAppSecret"
  description = "My application secret for DB connection"
}

# resource "aws_secretsmanager_secret_version" "my_secret_version" {
#   secret_id     = aws_secretsmanager_secret.my_secret.id
#   secret_string = jsonencode({
#     username = "admin"
#     password = "s3cr3t!"
#   })
# }
