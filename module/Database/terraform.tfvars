dbapp_environment={
production={
    server={
    sqlserver400900809={
        dbname="appdb"       
        sku="Basic"
    }}
   
    }
    
}




cosmosdb_sql_container = {
  "cosmosdb_sql_container" = {
    container_name="cosmosdb_sql_database"
  }
}

cosmosdb_sql_database = {
  "cosmosdb_sql_database" = {
     db_name="cosmosdb_sql_database"
  }
}

consistency_policy = {
  consistency_level = "Session"
}

capabilities = {
  "capabilities" = {
    name = "EnableFreeTier"
  }
}

kind = "GlobalDocumentDB"

offer_type = "Standard"

name = "cosmosdb_account"