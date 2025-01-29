resource "azurerm_cognitive_account" "cognitive_service" {
  name                = "cognitive_service"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku
  kind                = "CognitiveServices"
}