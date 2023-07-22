variable "acr_sku" {
  type    = string
  default = "Premium"
}

variable "admin_enabled" {
  type    = bool
  default = false
}

variable "georeplication_locations" {
  type    = list(string)
  default = ["East US", "West Europe"]
}

      