provider "azurerm" {
  environment     = "public"
  subscription_id = "${var.SUBSCRIPTION_ID}"
  version         = "1.29.0"
}

resource "azurerm_resource_group" "resourcegroup" {
  name     = "${var.ARM_RESOURCEGROUP}"
  location = "${var.ARM_LOCATION}"
  
}

resource "azurerm_virtual_network" "sharedservicesvnet" {
  name                = "${var.VNETNAME}"
  location            = "${var.ARM_LOCATION}"
  resource_group_name = "${azurerm_resource_group.resourcegroup.name}"
  address_space       = "${var.BASTIONSUBNETCIDR}"
  depends_on          = ["azurerm_resource_group.resourcegroup"]
}

resource "azurerm_subnet" "subnet-bastion" {
  name                 = "${var.SUBNET_NAME}"
  virtual_network_name = "${azurerm_virtual_network.sharedservicesvnet.name}"
  resource_group_name  = "${azurerm_resource_group.resourcegroup.name}"
  address_prefix       = "${var.BASTIONSUBNETCIDR_PREFIX}"
    depends_on           = ["azurerm_virtual_network.sharedservicesvnet", "azurerm_resource_group.resourcegroup"] 
  
}

resource "azurerm_public_ip" "bastionpip" {
  name                = "${var.IP_NAME}"
  location            = "${var.ARM_LOCATION}"
  resource_group_name = "${azurerm_resource_group.resourcegroup.name}"
  allocation_method   = "Static"
  sku                 = "Standard"
    depends_on          = ["azurerm_subnet.subnet-bastion", "azurerm_virtual_network.sharedservicesvnet", "azurerm_resource_group.resourcegroup"]
}

module "azurebastion" {
  source = "./azurebastion"
  IP_NAME                  = "${var.IP_NAME}"
  BASTION_NAME             = "${var.BASTION_NAME}"
  SUBNET_NAME              = "${var.SUBNET_NAME}"
  ARM_LOCATION             = "${var.ARM_LOCATION}"
  ARM_RESOURCEGROUP        = "${azurerm_resource_group.resourcegroup.name}"
  ARM_ENVIRONMENT_NAME     = "${var.ARM_ENVIRONMENT_NAME}"
  CUSTOMER_PREFIX          = "${var.CUSTOMER_PREFIX}"
  CUSTOMER_COSTCENTER      = "${var.CUSTOMER_COSTCENTER}"
  CUSTOMER_APPLICATION     = "${var.CUSTOMER_APPLICATION}"
  BASTIONSUBNETCIDR        = "${var.BASTIONSUBNETCIDR}"
  BASTIONSUBNETCIDR_PREFIX = "${var.BASTIONSUBNETCIDR_PREFIX}"
  VNETNAME                 = "${var.VNETNAME}"
}
