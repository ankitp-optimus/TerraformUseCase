variable "resource_group_name" {
  type= string
  description = "This defines the name of the resource group"
}

variable "location" {
  type= string
  description = "This defines the location of the resources"
}

variable "db_name" {
  type = string
}
variable "SQL_db_username" {
  type = string
}
variable "SQL_db_password" {
  type = string
}

variable "SKU" {
  type = object({
    tier = string
    size = string
  })
}

# variable "serverdata" {
#   type = object({
#     name = string
#   })
# }
# variable "cosmosdbdata" {
#   type = string
# }
# variable "activation_key" {
#   type = string
# }
