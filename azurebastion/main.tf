resource "azurerm_template_deployment" "bastion" {
  name                = "${var.BASTION_NAME}"
  deployment_mode     = "Incremental"
  resource_group_name = "${var.ARM_RESOURCEGROUP}"
    provisioner "local-exec" {
      command = "echo sleep 60s to propagate all permissions; sleep 60s"
 }
  template_body       = <<DEPLOY
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "bastionHostName": {
      "type": "string",
      "metadata": {
        "description": "Bastion Name"
      }
    },
    "location": {
      "type": "string",
      "metadata": {
        "description": "Location for all resources."
      }
    },
    "bastionServicesVnetName": {
      "type": "string",
      "metadata": {
        "description": "Virtual Network Name"
      }
    },
    "bastionServicesSubnetName": {
      "type": "string",
      "metadata": {
        "description": "Subnet Name"
      }
    },
    "publicIpAddressName": {
      "type": "string"
    },
    "COSTCENTRE": {
      "type": "string",
      "defaultValue": ""
    },
    "APPLICATION": {
      "type": "string",
      "defaultValue": ""
    },
    "ENVIRONMENT": {
      "type": "string",
      "defaultValue": ""
    }
  },
  "variables": {
    "subnetRefId": "[resourceId('Microsoft.Network/virtualNetworks/subnets', parameters('bastionServicesVnetName'), parameters('bastionServicesSubnetName'))]"
  },
  "resources": [
        {
          "apiVersion": "2018-10-01",
          "type": "Microsoft.Network/bastionHosts",
          "name": "[parameters('bastionHostName')]",
          "location": "[parameters('location')]",
          "properties": {
              "ipConfigurations": [
                  {
                      "name": "IpConf",
                      "properties": {
                          "subnet": {
                              "id": "[variables('subnetRefId')]"
                          },
                          "publicIPAddress": {
                              "id": "[resourceId('Microsoft.Network/publicIpAddresses', parameters('publicIpAddressName'))]"
                          }
                      }
                  }
              ]
          },
          "tags": {}
        }
  ],
  "outputs": {}
}
DEPLOY

  parameters = {
    "bastionHostName"             = "${var.BASTION_NAME}"
    "publicIpAddressName"         = "${var.IP_NAME}"
    "location"                    = "${var.ARM_LOCATION}"
    "bastionServicesVnetName"     = "${var.VNETNAME}"
    "bastionServicesSubnetName"   = "${var.SUBNET_NAME}"
    "COSTCENTER"                  = "${var.CUSTOMER_COSTCENTER}"
    "APPLICATION"                 = "${var.CUSTOMER_APPLICATION}"
    "ENVIRONMENT"                 = "${var.ARM_ENVIRONMENT_NAME}"
 }
}


