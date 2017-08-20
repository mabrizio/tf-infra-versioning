## >>>>> TF Config, please don't modify
data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "infrastrucute-versioning-w-tf"
    key    = "terraform.tfstate"
    dynamodb_table = "infrastrucute_versioning_w_tf"
    region = "us-east-1"
  }
}

data "external" "latest_version" {
  program = ["bash", "git-version.sh"]
}
## <<<< TF Config, please don't modify

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
