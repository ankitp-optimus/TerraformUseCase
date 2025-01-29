
# cosomodb sql 
resource "azurerm_cosmosdb_sql_database" "cosmosdb_sql_database" {
  name                = var.cosmosdb_sql_database.db_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
}

resource "azurerm_cosmosdb_sql_container" "cosmosdb_sql_container" {
  name                   = var.cosmosdb_sql_container.container_name
  resource_group_name    = var.resource_group_name
  account_name           = azurerm_cosmosdb_account.cosmosdb_account.name
  database_name          = azurerm_cosmosdb_sql_database.cosmosdb_sql_database.name
  partition_key_paths    = ["/definition/id"]
}

