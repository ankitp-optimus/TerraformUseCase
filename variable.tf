variable "dbapp_environment" {
    type=map(object(
        {
            server=map(object(
                {
                databases=map(object(
                    {
                        sku=string
                        sampledb=string
                    }
                ))
                }
            ))  

                    
            
        }
    )
    )
}

variable "azure_app_plan" {
  type = object({
    sku  = string
    tier = string
    size = string
  })
}

variable "key_vault_data" {
  type = map(object({
    sku_name=string
  }))
}
variable "WebAppService" {
  type = map(object({
    db_name = string
    # SQL_db_username=string
    # SQL_db_password=string
  }))
}

variable "App_service_SKU" {
    type = object({
      tier = string
      size = string
    })
  
}


variable "Database" {
    type = object({
      name = string
      offer_type = string
      kind = string
      capabilities = object({
        name = string 
      })
      consistency_policy= object({
        consistency_level = string 
      })
      cosmosdb_sql_database = object({
        db_name = string 
      })
      cosmosdb_sql_container = object({
        container_name = string 
      })
      dbapp_environment= map(object({
        server=map(object(
                {
                dbname=string
                sku=string
                }
            ))           
            
      }))
     
    })
  
}