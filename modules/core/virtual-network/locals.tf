locals {
  location_short_map = {
    southcentralus = "scu"
    northcentralus = "ncu"
  }

  location_short = local.location_short_map[var.location]
  resource_name  = format("%s-vnet-%s-%s-%s-%s", var.name_prefix, var.topology, var.environment, local.location_short, var.suffix)
}
