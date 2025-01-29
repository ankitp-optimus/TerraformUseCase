resource "azurerm_communication_service" "communication_service" {
  name                = "communicationservice"
  resource_group_name = var.resource_group_name
  data_location       = var.location
}