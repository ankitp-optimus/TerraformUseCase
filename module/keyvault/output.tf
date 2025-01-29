# Fetch the database username secret from Key Vault
data "azurerm_key_vault_secret" "SQL_db_username" {
  name         = azurerm_key_vault_secret.SQL_db_username.name
  key_vault_id = azurerm_key_vault.databasekeyvault.id
}

# Fetch the database password secret from Key Vault
data "azurerm_key_vault_secret" "SQL_db_password" {
  name         = azurerm_key_vault_secret.SQL_db_password.name
  key_vault_id = azurerm_key_vault.databasekeyvault.id
}

# Output the database username
output "SQL_db_username" {
  value = data.azurerm_key_vault_secret.SQL_db_username.value
}

# Output the database password
output "SQL_db_password" {
  value = data.azurerm_key_vault_secret.SQL_db_password.value
}
