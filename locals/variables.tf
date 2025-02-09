variable "project" {
  default = "Expense"
}
variable "component" {
  default = "Backend"
}

variable "Environment" {
  default = "Dev"
}

#variable "name" {
  #default = "${var.project}.${var.component}.${var.Environment}" (this is throwing error because variables can't refer other variables)
#} so we are using locals to refer variables