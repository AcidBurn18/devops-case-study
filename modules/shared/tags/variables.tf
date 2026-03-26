variable "common_tags" {
  description = "(Required) Common tags applied across all resources."
  type        = map(string)
  nullable    = false
}

variable "custom_tags" {
  description = "(Optional) Custom tags merged on top of the common tags."
  type        = map(string)
  default     = {}
  nullable    = false
}
