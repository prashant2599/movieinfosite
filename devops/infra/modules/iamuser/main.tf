resource "aws_iam_user" "this" {
    name = var.aws_iam_user
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each  = toset(var.aws_iam_policy_arn)
  user      = aws_iam_user.this.name
  policy_arn = each.value
}

resource "aws_iam_access_key" "this" {
    user = aws_iam_user.this.name
}
