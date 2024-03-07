variable "vpc_cidr_block" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "availability_zone" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "instance_type" {
  type = string
}
variable "Hash_Key_type" {
  type    = string
  default = "N"
}
variable "Hash_Key" {
  type = string
}