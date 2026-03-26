locals {
  merged_tags = merge(var.common_tags, var.custom_tags)
}
