resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "Azure-app-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = var.SKU.tier
    size = var.SKU.size
  }
}

# Backend Web App Service
resource "azurerm_app_service" "backend" {
  name                = "backend-app-service-terraform12345679"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = "~14"
    # COSMOSDB_CONNECTION_STRING = "AccountEndpoint=${var.cosmosdbdata};AccountKey=${var.activation_key};"

    # SQL Server connection string
    # SQL_DB_CONNECTION_STRING = "Server=tcp:${var.serverdata};User ID=${var.SQL_db_username};Password=${var.SQL_db_password};"
  }

  
}

# Output for Backend URL (required for Frontend)


# Frontend Web App Service with dependency on Backend
resource "azurerm_app_service" "frontend" {
  name                = "frontend-web-app-terraform12345679"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  depends_on = [azurerm_app_service.backend]

  app_settings = {
    REACT_APP_BACKEND_URL = "https://${azurerm_app_service.backend.default_site_hostname}"
  }
}
