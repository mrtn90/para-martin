resource "aws_lb_target_group" "p6-tg" {
  name        = "p6-tg"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc-p6.id
}

resource "aws_alb_target_group_attachment" "p6-tg-attachment" {
  target_group_arn = aws_lb_target_group.p6-tg.arn
  target_id        = aws_instance.p6-instance.id
  port             = 80
}

resource "aws_lb" "p6-lb" {
  name               = "p6-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.p6-lb-sg.id]
  subnets            = [aws_subnet.p6-private-subnet.id, aws_subnet.p6-private-subnet-2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "p6-listner" {
  load_balancer_arn = aws_lb.p6-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.p6-tg.arn
  }
}


resource "aws_lb_listener_rule" "p6-listener-rule" {
  listener_arn = aws_lb_listener.p6-listner.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.p6-tg.arn

  }

  condition {
    path_pattern {
      values = ["/var/www/html/index.html"]
    }
  }
}
