dbapp_environment={
    production={
        server={
            sqlserver400900809={
                databases={
                    appsqldb={
                        sku="S0"
                        sampledb=null
                    }
                }
            }
            cosmodb400900809={
                databases={
                    appcosmodb={
                        sku="S0"
                        sampledb=null
                    }
                }
            }
        }
        
    }
}
azure_app_plan = {
  sku  = "S1"
  tier = "Standard"
  size = "s1"
}


# Web APP
WebAppService = {
  "WebAppService" = {
    db_name= "SQL Database"
  }
}


key_vault_data = {
  "key_vault_data" = {
    sku_name="standard"
  }
}

App_service_SKU = {
 tier = "Standard"
size = "s1"
}

Database = {
  name = "cosmosdb-account"
  offer_type = "Standard"
  kind = "GlobalDocumentDB"
  capabilities = {
    name= "EnableFreeTier"
  }
  consistency_policy = {
    consistency_level = "Session"
  }
    cosmosdb_sql_database = {
       db_name="cosmosdb_sql_database"
    }
    dbapp_environment = {
      production={
    server={
    sqlserver400900809={
        dbname="appdb"       
        sku="Basic"
    }}
   
    }
    
    }
    cosmosdb_sql_container = {
       container_name="cosmosdb_sql_database"
    }
    

}