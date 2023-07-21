variable "acr_container_name" {
  type = string
  default = "acr"
}

variable "acr_resourse_group_name" {
  type = string
  
}

variable "acr_resourse_group_location" {
  type = string
}

variable "acr_sku" {
    type = string
}

variable "acr_admin_enabled" {
  type = bool
  default = false
}

variable "acr_georeplication_locations" {
  type = list(string)  
}

