variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-03295ec1641924349"
    us-west-1 = "ami-0f6c23a2bfb63fbf1"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ah-devops"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ah-devops.pub"
}