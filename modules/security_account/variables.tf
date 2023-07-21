variable "sa_base_name" {
    type = string
    description = "stores the security account name"
  
}
variable "sa_location" {
    type = string
    default = "West US"
    description = "stores the security account name"  
}
 
variable "sa_resource_group_name" {
    type = string
    description = "stores the resourse group name for storage account"
  
}

variable "sa_account_tier"{
    type = string
    default = "Standard"
    description = "sa tier type"
}

variable "sa_account_replication_type" {
    type = string
    default = "GRS"
    description = "sa replication type"
}