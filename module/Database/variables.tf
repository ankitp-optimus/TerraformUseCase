variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "offer_type" {
  type    = string
  
}

variable "kind" {
  type    = string
  
}

variable "capabilities" {
  type = object({
    name = string
  })
 
}

variable "consistency_policy" {
  type = object({
    consistency_level = string
  })
  
}


variable "cosmosdb_sql_database" {
  type = object({
    db_name = string
  })
  
}
variable "cosmosdb_sql_container" {
  type = object({
    container_name = string
  })
  
}





variable "dbapp_environment" {
    type=map(object(
        {
            server=map(object(
                {
                dbname=string
                sku=string
                }
            ))           
            
        }
    )
    )
}

variable "SQL_db_password" {
  type = string
}


variable "SQL_db_username" {
  type = string
}