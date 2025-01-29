resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  offer_type                    = var.offer_type
  kind                          = var.kind # Required for SQL API
  public_network_access_enabled = true

  # Basic configurations
   capabilities {
    name = "EnableServerless"  # Example of a valid capability
  }

  # Geo-location setup
  geo_location {
    location          = var.location
    failover_priority = 0
    zone_redundant    = false
  }

  # Default consistency policy for SQL API
  consistency_policy {
    consistency_level = var.consistency_policy.consistency_level
  }

  # Lifecycle settings to prevent overwriting default identity changes
  lifecycle {
    ignore_changes = [
      default_identity_type
    ]
  }
}





# SQL server creation

resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.dbapp_environment.production.server
  name                         = each.key
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.SQL_db_username
  administrator_login_password = var.SQL_db_password

}





