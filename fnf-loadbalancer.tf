# configuracao do loadbalancer
resource "aws_alb" "fnf-alb" {
    name = "fnf-alb"
    internal = true
    load_balancer_type =  "application"

    subnets = [ 
        aws_subnet.fnf-subnet-private1-us-east-1a.id,
        aws_subnet.fnf-subnet-private2-us-east-1b.id
    ]
    
    security_groups = [ 
        aws_security_group.fnf-lb-security-group.id
    ]

    depends_on = [ aws_internet_gateway.fnf-igw ]
}

# configuracao de listener http produto
resource "aws_lb_listener" "fnf-alb-http-listener" {
    load_balancer_arn = aws_alb.fnf-alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.fnf-lb-ms-produto-target-group.arn
    }
}

# configuracao de produto target group do loadbalancer
resource "aws_lb_target_group" "fnf-lb-ms-produto-target-group" {
    name = "fnf-lb-ms-produto-target-group"
    port = 3000
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = aws_vpc.fnf-vpc.id
    
    health_check {
      enabled = true
      path = "/health"
    }

    depends_on = [ aws_alb.fnf-alb ]
}

# configuracao de pagamento target group do loadbalancer
resource "aws_lb_target_group" "fnf-lb-ms-pagamento-target-group" {
    name = "fnf-lb-ms-pagamento-target-group"
    port = 3000
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = aws_vpc.fnf-vpc.id
    
    health_check {
      enabled = true
      path = "/health"
    }

    depends_on = [ aws_alb.fnf-alb ]
}

# configuracao de pedido target group do loadbalancer
resource "aws_lb_target_group" "fnf-lb-ms-pedido-target-group" {
    name = "fnf-lb-ms-pedido-target-group"
    port = 3000
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = aws_vpc.fnf-vpc.id
    
    health_check {
      enabled = true
      path = "/health"
    }

    depends_on = [ aws_alb.fnf-alb ]
}

resource "aws_lb_listener_rule" "fnf-alb-listener-rule-produto" {
    listener_arn = aws_lb_listener.fnf-alb-http-listener.arn
    
    action {
      type = "forward"
      target_group_arn = aws_lb_target_group.fnf-lb-ms-produto-target-group.arn
    }

    condition {
      path_pattern {
        values = [ "/v1/produto/*", "/v1/categoria/*" ]
      }
    }  
    
}

resource "aws_lb_listener_rule" "fnf-alb-listener-rule-pagamento" {
    listener_arn = aws_lb_listener.fnf-alb-http-listener.arn
    
    action {
      type = "forward"
      target_group_arn = aws_lb_target_group.fnf-lb-ms-pagamento-target-group.arn
    }

    condition {
      path_pattern {
        values = [ "/v1/pagamento/*"]
      }
    }  
}

resource "aws_lb_listener_rule" "fnf-alb-listener-rule-pedido" {
    listener_arn = aws_lb_listener.fnf-alb-http-listener.arn
    
    action {
      type = "forward"
      target_group_arn = aws_lb_target_group.fnf-lb-ms-pedido-target-group.arn
    }

    condition {
      path_pattern {
        values = [ "/v1/pedido/*", "/v1/item/*","/v1/cliente/*" ]
      }
    }  
}