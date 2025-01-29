module "ResourceGroup" {
  source = "./module/ResourceGroup"
  resource_group_name = local.resource_group_name
  location = local.resource_location
}

module "KeyVault" {
    source = "./module/keyvault"
    location = local.resource_location
    resource_group_name = local.resource_group_name
    key_vault_data=var.key_vault_data
  
}

module "WebAppService" {
  source = "./module/WebAppService"
  db_name = var.WebAppService.WebAppService.db_name
  resource_group_name = local.resource_group_name
  location = local.resource_location
  SQL_db_username = module.KeyVault.SQL_db_username
  SQL_db_password = module.KeyVault.SQL_db_password
  SKU = var.App_service_SKU
#   serverdata=module.Database.sqlServerdata
#   cosmosdbdata=module.Database.cosmosdbdata
#   activation_key=module.Database.activation_key
}

module "Database" {
    source = "./module/Database"
    resource_group_name = local.resource_group_name
    location = local.resource_location
    offer_type = var.Database.offer_type
    cosmosdb_sql_container = var.Database.cosmosdb_sql_container
    dbapp_environment = var.Database.dbapp_environment
    kind = var.Database.kind
    capabilities = var.Database.capabilities
    name = var.Database.name
    SQL_db_password = module.KeyVault.SQL_db_password
    SQL_db_username = module.KeyVault.SQL_db_username
    cosmosdb_sql_database = var.Database.cosmosdb_sql_database
    consistency_policy = var.Database.consistency_policy

  
}

module "AzureCommunicationService" {
  source = "./module/AzureCommunicationService"
  resource_group_name = local.resource_group_name
  location = local.communication_service_location
}



module "appinsights" {
  source = "./module/appInsights"
  resource_group_name = local.resource_group_name
  location = local.resource_location
}
