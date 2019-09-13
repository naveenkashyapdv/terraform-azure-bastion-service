variable "ARM_RESOURCEGROUP" {
  description = "Name of the Resource Group where the resources should be deployed into."
  type        = "string"
}

variable "IP_NAME" {
  description = "Name of the ip"
  type        = "string"
}

variable "BASTION_NAME" {
  description = "Name of the bastion host"
  type        = "string"
}

variable "SUBNET_NAME" {
  description = "name of subnet"
  type        = "string"
}

variable "ARM_LOCATION" {
  description = "Which Azure location are we supposed to use?"
  type        = "string"
}

variable "ARM_ENVIRONMENT_NAME" {
  type        = "string"
  description = "Name of the environment to be deployed"
}

variable "CUSTOMER_PREFIX" {
  type        = "string"
  description = "Three Character customer prefix"
}

variable "CUSTOMER_COSTCENTRE" {
  type        = "string"
  description = "Customer Specific Cost Center"

}

variable "CUSTOMER_APPLICATION" {
  type        = "string"
  description = "Customer Application Name"
}

variable "BASTIONSUBNETCIDR" {
  type        = "list"
  description = "CIDR Range for the bastion subnet"
}
variable "BASTIONSUBNETCIDR_PREFIX" {
  type        = "string"
  description = "CIDR Range for the bastion subnet"
}

variable "VNETNAME" {
  type        = "string"
  description = "vnetname where ther Firewall is created in"
}
