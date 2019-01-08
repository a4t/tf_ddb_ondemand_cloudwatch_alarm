# Common
variable "table_name" {}

variable "alarm_prefix" {
  default = "dynamodb"
}

variable "alarm_actions" {
  default = []
}

# Read
variable "read_threshold" {}

variable "read_evaluation_periods" {
  default = 1
}

variable "read_period" {
  default = 60
}

# Write
variable "write_threshold" {}

variable "write_evaluation_periods" {
  default = 1
}

variable "write_period" {
  default = 60
}

# GSI
variable "gsi" {
  default = []
}
