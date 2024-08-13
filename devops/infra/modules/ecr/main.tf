resource "aws_ecr_repository" "this" {
    name = var.aws_ecr_repository
    image_tag_mutability =  var.aws_ecr_tag_
    image_scanning_configuration {
      scan_on_push = var.aws_ecr_image_scanning   
    }
}

