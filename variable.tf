variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "virtual_network_name" {
  type        = string
  description = "Name of the VNet"
}
variable "subnet" {
  type        = string
  description = "Name of the Subnet"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}
variable "network_security_group" {
  type        = string
  description = "security group name in Azure"
}
