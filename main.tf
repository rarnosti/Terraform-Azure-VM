# Terraform provider AzureRM check version on the link below
# https://github.com/hashicorp/terraform-provider-azurerm
Terraform {
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "2.98.0"
        }
    }
}

#Azure Provider
provider "azurerm"{
    features {}
}

#Create Resource Groip
resource "azurerm_resource_group" "rg-dc"{
    name = "mgmt-rg"
    location = "UK South"
}

#Create Vnet
resource "azurerm_virtual_network" "vnet-01"{
    name = "mgmt-vnet"
    resource_group_name = azurerm_resource_group.rg-dc.name
    location = azurerm_resource_group.rg-dc.location
    address_space = ["10.0.0.16"]
}

#Create Subnet
resource "azurerm_subnet" "subnet-01"{
    name = "directory"
    resource_group_name = azurerm_resource_group.rg-dc.name
    virtual_network_name = azurerm_virtual_network.vnet-01.name
    address_prefixes = [ "10.0.1.0/24" ]
}