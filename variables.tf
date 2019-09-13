variable "ARM_RESOURCEGROUP" {
  description = "Name of the Resource Group where the resources should be deployed into."
  type        = "string"
  default     = "demo-sandbox-RG"
}

variable "IP_NAME" {
  description = "Name of the ip"
  type        = "string"
  default     = "demo-sandbox-demo-ip"
}

variable "BASTION_NAME" {
  description = "Name of the bastion host"
  type        = "string"
  default     = "demo-sandbox-demo-name"
}

variable "SUBNET_NAME" {
  description = "name of subnet"
  type        = "string"
  default     = "AzureBastionSubnet"
}

variable "ARM_LOCATION" {
  description = "Which Azure location are we supposed to use?"
  type        = "string"
  default     = "East US"
}

variable "ARM_ENVIRONMENT_NAME" {
  type        = "string"
  description = "Name of the environment to be deployed"
  default     = "demo"
}

variable "CUSTOMER_PREFIX" {
  type        = "string"
  description = "Three Character customer prefix"
  default     = "demo"
}

variable "CUSTOMER_COSTCENTRE" {
  type        = "string"
  description = "Customer Specific Cost Center"
  default     = "demo"

}

variable "CUSTOMER_APPLICATION" {
  type        = "string"
  description = "Customer Application Name"
  default     = "Azure-Bastion-demo"
}

variable "BASTIONSUBNETCIDR" {
  type        = "list"
  description = "CIDR Range for the bastion subnet"
  default     = [""]
}

variable "BASTIONSUBNETCIDR_PREFIX" {
  type        = "string"
  description = "CIDR Range for the bastion subnet"
  default     = ""
}

variable "VNETNAME" {
  type        = "string"
  description = "vnetname "
  default     = "demo-sandbox-bastion"
}


variable "LOG_ANALYTICS" {
  type        = "string"
  description = "Name of the Log analytics"
  default     = "demo-sandbox-log-analytics"
}


variable "SUBSCRIPTION_ID" {
  type        = "string"
  description = "Name of the scription id"
  default     = ""
}
