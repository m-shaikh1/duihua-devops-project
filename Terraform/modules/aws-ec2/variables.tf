variable "ami-image" {
  type    = string
  default = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  type    = string
  default = "t2.large"
}

variable "subnet_id" {
  
}

variable "vpc_security_group_ids" {
  
}
variable "key_name" {
  
}
variable "AWS_ACCESS_KEY_ID" {
    description = "Plaese Enter AWS Access Key ID that will be used for Jenkins"
}
variable "AWS_SECRET_ACCESS_KEY" {
  description = "Plaese Enter AWS Secret Access Key that will be used for Jenkins"
}
variable "AWS_REGION" {
  description = "Plaese Enter Default AWS Region that will be used for Jenkins"
}