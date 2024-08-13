resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
      name = "mainvpcecsecr"
    }
}

#add two subnet

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
  
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.main.id
    cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1b"
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
      name = "vpcecsecrigw"
    } 
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.main.id
    route =  [{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }] 
}


resource "aws_route_table_association" "subnet1_route" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rt.id
  
}
resource "aws_route_table_association" "subnet2_route" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "security_group" {
    name = "ecs-ecr-sg"
    vpc_id = aws_vpc.main.id

    ingress = [{
        from_port = 0
        to_port = 0
        protocol = -1
        self = "false"
        cidr_blocks = ["0.0.0.0/0"]
        description = "any"
    }]  

    egress = [{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }]
}
