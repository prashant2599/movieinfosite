resource "aws_instance" "myproject" {
    ami = var.aws_instance_image
    instance_type = var.aws_instance_type
    subnet_id = aws_subnet.aws_myproject_subnet.id
    security_groups = aws_security_group.aws_myproject_sg.id

    tags = {
      name = var.aws_instance_tag
    }
}