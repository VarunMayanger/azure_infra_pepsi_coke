variable "sku_tier"{
    type = string
} 

variable "sku_size"{
    type = string
}

variable "web_app_service_resource_group_name" {
    type = string  
}

variable "web_app_service_resource_name" {
  type = string
}

variable "web_app_service_location" {
  type = string
}

variable "web_app_service_kind" {
  type = string
  default = "linux"
}

variable "web_app_service_reserved" {
  type = bool  
}