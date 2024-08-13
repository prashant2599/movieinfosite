variable "aws_iam_user" {
    description = "This is the iamuser"
    type = string
}

variable "aws_iam_policy_arn" {
    description = "this is the policy arn"
    type = list(string)
}