variable "keyvault_name" {
    type = string
}

variable "location" {
    type = string
    default = "East US"
}
variable "resource_group_name" {
    type = string
}


#variable "service_principal_object_id" {}
#variable "service_principal_tenant_id" {}

variable "key_permissions" {
  type = list(string)
  default = ["Delete", "Create", "Update", "Get"]
}

variable "secret_permissions" {
  type = list(string)
  default = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}

variable "key_vault_id" {
    type = string  
}
variable "name" {
    type = string  
}  

variable "value" {
    type = string 
}

