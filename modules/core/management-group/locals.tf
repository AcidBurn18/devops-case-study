locals {
  management_group_name = format("mg-%s-%s-%s", var.name_prefix, var.topology, var.environment)
  management_group_display_name = coalesce(
    var.display_name,
    format("%s %s Platform", title(var.topology), upper(var.environment))
  )
}
