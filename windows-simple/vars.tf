variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0f93c815788872c5d"
    us-east-2 = "ami-0239d3998515e9ed1"
    us-west-1 = "ami-08bcc13ad2c143073"
    us-west-2 = "ami-029e27fb2fc8ce9d8"
    eu-west-1 = "ami-0b5271aea7b566f9a"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ah-devops"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "ah-devops.pub"
}