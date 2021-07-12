provider "azurerm" {
  features {

  }
}

terraform {
  backend "azurerm" {
    resource_group_name = "tf_rg_blobstorage"
    storage_account_name = "tfstorageaenirque80"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}
resource "azurerm_resource_group" "eltf_test" {
  name     = "tfmainrgel"
  location = "West Europe"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi_el"
  location            = azurerm_resource_group.eltf_test.location
  resource_group_name = azurerm_resource_group.eltf_test.name
  ip_address_type     = "public"
  dns_name_label      = "enirque80watest"
  os_type             = "Linux"
  container {
    name   = "weatherapi"
    image  = "enirque80/weatherapi"
    cpu    = "1"
    memory = "1"
    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
