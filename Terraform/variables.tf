variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "the public subnet CIDR blocks"
  default     = "192.168.1.0/24"
  type        = string
}
variable "public_subnet2_cidr_blocks" {
  description = "the public subnet CIDR blocks"
  default     = "192.168.2.0/24"
  type        = string
}

variable "REGION" {

  type    = string
  default = "us-east-1"

}

variable "ami-image" {
  type    = string
  default = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  type    = string
  default = "t2.large"
}

variable "eb-app-name" {
  default = "sudos-duihua-app"
}
variable "eb-env-name" {
  default = "sudos-duihua-env"
}
variable "eb-solution-stack-name" {
  default = "64bit Amazon Linux 2 v4.2.18 running Tomcat 8.5 Corretto 11"
}