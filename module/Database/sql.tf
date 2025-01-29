

resource "azurerm_mssql_database" "appdb" {
   for_each = var.dbapp_environment.production.server
  name         = each.value.dbname
  server_id    = azurerm_mssql_server.sqlserver[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = each.value.sku


}

resource "azurerm_mssql_firewall_rule" "allowmyClient" {
  name             = "AllowClientIP"
  server_id        = azurerm_mssql_server.sqlserver["sqlserver400900809"].id
  start_ip_address = "94.204.16.49"
  end_ip_address   = "94.204.16.49"
}