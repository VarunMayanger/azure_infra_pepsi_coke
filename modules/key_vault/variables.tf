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

variable "key_permissions" {
  type = list(string)
  default = ["Delete", "Create", "Update", "Get"]
}

variable "secret_permissions" {
  type = list(string)
  default = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}


variable "name" {
    type = string  
}  

variable "value" {
    type = string 
}

