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

