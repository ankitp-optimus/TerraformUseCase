data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "databasekeyvault" {
  name                = "databasekeyvault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.key_vault_data.key_vault_data.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get", "Set", "List", "Delete",
    ]
  }
}

# Add the database username and password as secrets in Key Vault
resource "azurerm_key_vault_secret" "SQL_db_username" {
  name         = "SQLdbusername"
  value        = "admin" # Replace with sensitive username data if needed
  key_vault_id = azurerm_key_vault.databasekeyvault.id
}

resource "azurerm_key_vault_secret" "SQL_db_password" {
  name         = "SQLdbpassword"
  value        = "Optimus@12345" # Replace with sensitive password data if needed
  key_vault_id = azurerm_key_vault.databasekeyvault.id
}
