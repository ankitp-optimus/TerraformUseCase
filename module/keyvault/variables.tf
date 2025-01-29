variable "resource_group_name" {
  type= string
  description = "This defines the name of the resource group"
}

variable "location" {
  type= string
  description = "This defines the location of the resources"
}

variable "key_vault_data" {
  type = map(object({
    sku_name=string
  }))
}