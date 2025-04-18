resource "aws_route53_zone" "primary" {
  count   = var.enable_route53 ? 1 : 0
  name    = "frosthand.com"
}

resource "aws_route53_record" "www" {
  count   = var.enable_route53 ? 1 : 0
  zone_id = aws_route53_zone.primary[0].zone_id     # Your hosted zone ID
  name    = "www.frosthand.com"    # Full domain name
  type    = "A"
  ttl     = 300
  records = [var.coldhand_ip]     # The IP you want to point to
}
