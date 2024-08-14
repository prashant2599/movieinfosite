variable "aws_ecr_repository" {
    description = "Private ECR"
    type = string
}

variable "aws_ecr_image_scanning" {
    description = "Scanning Image"
    type = bool
}

variable "aws_ecr_tag_" {
    description = "Tag MUtable or Dismutable"
    type = string
}