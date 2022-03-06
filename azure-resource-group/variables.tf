variable "azure_location" {
  description = "Value of the azure location for resources"
  type        = string
  default     = "uksouth"
}
variable "resourcename" {
  description = "Value to be prefixed to all resources"
  type        = string
  default     = "Terraform_"
}