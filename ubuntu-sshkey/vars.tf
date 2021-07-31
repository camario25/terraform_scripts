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
    us-east-1 = "ami-09e67e426f25ce0d7"
    us-west-1 = "ami-0d382e80be7ffdae5"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "tf-ubuntu"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "tf-ubuntu.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
