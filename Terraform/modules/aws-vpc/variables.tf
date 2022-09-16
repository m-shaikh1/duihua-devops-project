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