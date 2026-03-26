locals {
  location_short_map = {
    southcentralus = "scu"
    northcentralus = "ncu"
  }

  location_short = local.location_short_map[var.location]
  resource_name  = format("%s-vnet-%s-%s-%s-%s", var.name_prefix, var.topology, var.environment, local.location_short, var.suffix)
  create_peering = var.remote_virtual_network_id != null && var.remote_virtual_network_name != null && var.remote_resource_group_name != null
}
