variable "sg_name" {
    type = string
    default = "sg_pepsi"
    description = "specifiec the name of scurity group"
}

variable "sg_location" {
    type = string
    default = "East US"
    description = "location of security group"
}

variable "sg_resource_group_name" {
    type = string
    description = "stores the resourse group name for security group"
}

variable "security_rule_name" {
    type = string
    description = "stores the security rule name" 
}

variable "security_rule_priority" {
    type = string
    description = "stores the security rule priority" 
}

variable "security_rule_direction" {
    type = string
    default = "Inbound"
    description = "stores the security rule direction (Inbound/Outbound)" 
}

variable "security_rule_access" {
    type = string
    default = "Allow"
    description = "stores the security rule access type" 
}

variable "security_rule_protocol" {
    type = string
    default = "Tcp"
    description = "stores the security rule protocol" 
}

variable "security_rule_source_port_range" {
    type = string
    default = "*"
    description = "stores the source port range" 
}

variable "security_rule_destination_port_range" {
    type = string
    default = "*"
    description = "stores the destination port range" 
}

variable "security_rule_source_address_prefix" {
    type = string
    default = "*"
    description = "stores the security rule source address prefix" 
}

variable "security_rule_destination_address_prefix" {
    type = string
    default = "*"
    description = "stores the security rule destination address prefix" 
}