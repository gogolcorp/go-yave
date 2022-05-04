variable "environment" {
  type        = string
  description = "Current environment where the database will be created."
}

variable "override_special" {
  type = string
  description = "Special characters for random password."
  default = "!#*()-_=+"
}

variable "rdb_instance_id" {
  type = string
  description = "The project rdb instance ID."
}