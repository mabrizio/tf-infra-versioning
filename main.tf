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
