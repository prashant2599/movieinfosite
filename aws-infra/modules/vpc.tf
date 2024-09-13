resource "aws_vpc" "myprojectvpc" {
    cidr_block = var.aws_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    

    tags = {
      name = var.aws_vpc_tag
    }
}

resource "aws_subnet" "aws_myproject_subnet" {
    cidr_block = var.aws_subnet_cidr
    vpc_id = aws_vpc.myprojectvpc.id
    availability_zone = var.aws_available_zone

    tags = {
      name = var.aws_subnet_tags
    }
  
}

resource "aws_security_group" "aws_myproject_sg" {
        vpc_id = aws_vpc.myprojectvpc.id


          egress {
                from_port   = 0
                to_port     = 0
                protocol    = "-1"
                cidr_blocks = ["0.0.0.0/0"]
            }


            ingress = {
                from_port =  80
                to_port = 80
                protocol = tcp
                cidr_block = ["0.0.0.0/0"]
            }

            ingress {
                from_port   = 443
                to_port     = 443
                protocol    = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
            }

            tags = {
              name = var.aws_sg_tag
            }
}



