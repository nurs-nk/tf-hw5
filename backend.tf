terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "tf-s3-tentek"
    key    = "tf-hw5-state-file"
  }
}
