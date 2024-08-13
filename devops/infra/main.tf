module "awsiamuserandpolicy" {
  source             = "./modules/iamuser"
  aws_iam_user       = "awsecsecrs3"
  aws_iam_policy_arn = ["arn:aws:iam::aws:policy/AdministratorAccess", "arn:aws:iam::aws:policy/AmazonECS_FullAccess", ]
}

module "awsecrcreate" {
  source                 = "./modules/ecr"
  aws_ecr_repository     = "movieinfo"
  aws_ecr_tag_           = "IMMUTABLE"
  aws_ecr_image_scanning = true
}

module "aws_ecs_cluster" {
  source = "./modules/ecs"
  aws_ecs_cluster_name = "movieinfosite"
}


module "vpc" {
  source = "./modules/vpc"
  
}