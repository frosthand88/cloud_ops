# 4. Create an Application Load Balancer
resource "aws_lb" "app_lb" {
  count              = var.enable_alb ? 1 : 0
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.main[0].id]
  security_groups    = [aws_security_group.alb_sg[0].id]
}

# 5. Create a target group with IP target type
resource "aws_lb_target_group" "ip_targets" {
  count       = var.enable_alb ? 1 : 0
  name        = "ip-targets"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main[0].id
  target_type = "ip"
}

# 6. Register specific IP addresses in the target group
resource "aws_lb_target_group_attachment" "ip1" {
  count            = var.enable_alb ? 1 : 0
  target_group_arn = aws_lb_target_group.ip_targets[0].arn
  target_id        = var.coldhand_ip # Replace with your IP
  port             = 80
}

# 7. Create a listener to forward to the target group
resource "aws_lb_listener" "http" {
  count             = var.enable_alb ? 1 : 0
  load_balancer_arn = aws_lb.app_lb[0].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip_targets[0].arn
  }
}