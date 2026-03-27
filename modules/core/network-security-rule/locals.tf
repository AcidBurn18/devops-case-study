locals {
  merged_nsg_rule_map = merge(var.common_nsg_rules, var.custom_nsg_rules)
}
