variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity-demo"
}
variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "West Europe"
}
variable "vmcount" {
  description = "The amount of virtual maschines created behind the load balancer."
  default = 2
}
variable "tags" {
    description = "Tags for the resources"
    default = {"udacity":"test"}
}
