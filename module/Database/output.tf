
# output "sqlServerdata"{
#     value=azurerm_mssql_server.sqlserver["${each.key}"].fully_qualified_domain_name
# }
# output "cosmosdbdata" {
#   value=azurerm_cosmosdb_account.cosmosdb_account.endpoint
# #   azurerm_cosmosdb_account.cosmosdb_account.primary_master_key
# }
# output "activation_key" {
#   value=data.azurerm_cosmosdb_account_keys.cosmosdb_keys.primary_master_key
#   sensitive = true
# }