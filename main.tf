# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}


data "archive_file" "lambda" {
  type        = "zip"
  source_file = "hello_lambda.py"
  output_path = "hello_lambda.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "hello_lambda.zip"
  function_name = "my_hello_lambda"    
  role          = aws_iam_role.iam_lambda_role.arn
  handler       = "hello_lambda.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime = "python3.11"
}
