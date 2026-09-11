variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"

}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}