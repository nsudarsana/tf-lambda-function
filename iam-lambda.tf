resource "aws_iam_role_policy" "iam_lambda_policy" {
  name = "iam_lambda_policy"
  role = aws_iam_role.iam_lambda_role.id

  policy = "${file("iam/iam-lambda-policy.json")}"
}


resource "aws_iam_role" "iam_lambda_role" {
  name = "iam_lambda_role"

  assume_role_policy = "${file("iam/iam-lambda-assume-policy.json")}"
}