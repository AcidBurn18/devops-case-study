module "tag_outputs" {
  source = "../../modules/shared/tags"

  topology    = var.topology
  environment = var.environment
  common_tags = local.common_tags
  custom_tags = var.custom_tags
}

module "resource_group" {
  source = "../../modules/core/resource-group"

  name_prefix = var.name_prefix
  topology    = var.topology
  environment = var.environment
  location    = var.location
  suffix      = var.suffix
  tags        = module.tag_outputs.tags
}

module "virtual_network" {
  source = "../../modules/core/virtual-network"

  name_prefix         = var.name_prefix
  resource_group_name = module.resource_group.name
  topology            = var.topology
  environment         = var.environment
  location            = var.location
  suffix              = var.suffix
  address_space       = var.vnet_address_space
  tags                = module.tag_outputs.tags

  remote_virtual_network_id   = var.remote_virtual_network_id
  remote_virtual_network_name = var.remote_virtual_network_name
  remote_resource_group_name  = var.remote_resource_group_name
}

module "app_subnet" {
  source = "../../modules/core/subnet"

  name_prefix          = var.name_prefix
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  topology             = var.topology
  environment          = var.environment
  location             = var.location
  suffix               = "01"
  address_prefixes     = var.app_subnet_address_prefixes
  service_endpoints    = var.app_subnet_service_endpoints
  common_nsg_rules     = var.common_nsg_rules
  custom_nsg_rules     = var.app_custom_nsg_rules
  common_udr_routes    = var.common_udr_routes
  custom_udr_routes    = var.app_custom_udr_routes
  tags                 = module.tag_outputs.tags
}

module "data_subnet" {
  source = "../../modules/core/subnet"

  name_prefix          = var.name_prefix
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  topology             = var.topology
  environment          = var.environment
  location             = var.location
  suffix               = "02"
  address_prefixes     = var.data_subnet_address_prefixes
  service_endpoints    = var.data_subnet_service_endpoints
  common_nsg_rules     = var.common_nsg_rules
  custom_nsg_rules     = var.data_custom_nsg_rules
  common_udr_routes    = var.common_udr_routes
  custom_udr_routes    = var.data_custom_udr_routes
  tags                 = module.tag_outputs.tags
}
