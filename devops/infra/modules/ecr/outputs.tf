output "aws_ecr_uri" {
    value = aws_ecr_repository.this.repository_url
}

output "aws_ecr_repo_name" {
    value = aws_ecr_repository.this.name
}

output "aws_ecr_repo_arn" {
    value = aws_ecr_repository.this.arn
}