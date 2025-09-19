terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.45.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rajesh" {
  name = "Rajesh"
  location = "West Europe"
  
}

resource "azurerm_virtual_network" "RajeshVnet" {
  name = var.vm_name
  resource_group_name = var.rg_name
  location = var.rg_location
  address_space = ["10.0.0.0/16"]
  dns_servers = ["10.0.0.4", "10.0.0.5"]
 
 subnet  {
  name = "subnet1"
  address_prefixes = ["10.0.1.0/24"]
 }
 
 subnet  {
  name = "subnet2"
  address_prefixes = ["10.0.2.0/24"]
 }
  
}

resource "azurerm_network_interface" "r-nic" {
  name = "rajesh-nic"
  resource_group_name = var.rg_name
  location = var.rg_location

  ip_configuration {
    name = "testing_configuration"
    subnet_id = azurerm_virtual_network.RajeshVnet.subnet1.subnet_id
    private_ip_address_allocation = "Dynamic"

  }
  
}





