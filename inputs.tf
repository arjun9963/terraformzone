variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is network cidr"
}

variable "subnet_cidr_ranges" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]
  description = "This is network cidr ranges"
}

variable "subnet_names" {
  type        = list(string)
  default     = ["web1", "web2", "app1", "app2", "db1", "db2"]
  description = "This are subnet names"
}

variable "subnet_count" {
  type    = number
  default = 6
}

variable "web_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "This is web security group config"
}

variable "app_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "This is app security group config"
}

variable "db_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "This is db security group config"

}




variable "web1_subnet_cidr" {
  type        = string
  default     = "10.10.0.0/24"
  description = "This is web1 subnet cidr"
}