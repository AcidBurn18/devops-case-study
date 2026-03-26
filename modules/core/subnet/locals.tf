locals {
  location_short_map = {
    southcentralus = "scu"
    northcentralus = "ncu"
  }

  location_short = local.location_short_map[var.location]
  resource_name  = format("%s-subnet-%s-%s-%s-%s", var.name_prefix, var.topology, var.environment, local.location_short, var.suffix)
  nsg_name       = format("%s-nsg-%s-%s-%s-%s", var.name_prefix, var.topology, var.environment, local.location_short, var.suffix)
  udr_name       = format("%s-udr-%s-%s-%s-%s", var.name_prefix, var.topology, var.environment, local.location_short, var.suffix)

  merged_nsg_rules = concat(var.common_nsg_rules, var.custom_nsg_rules)
  merged_udr_routes = concat(var.common_udr_routes, var.custom_udr_routes)

  merged_nsg_rule_map = {
    for idx, rule in local.merged_nsg_rules :
    format("%02d", idx + 1) => merge(
      rule,
      {
        suffix = try(rule.suffix, format("%02d", idx + 1))
        name   = format("%s-nsgrule-%s-%s-%s-%s", var.name_prefix, var.topology, var.environment, local.location_short, try(rule.suffix, format("%02d", idx + 1)))
      }
    )
  }

  merged_udr_route_map = {
    for idx, route in local.merged_udr_routes :
    format("%02d", idx + 1) => merge(
      route,
      {
        suffix = try(route.suffix, format("%02d", idx + 1))
        name   = format("%s-route-%s-%s-%s-%s", var.name_prefix, var.topology, var.environment, local.location_short, try(route.suffix, format("%02d", idx + 1)))
      }
    )
  }
}
