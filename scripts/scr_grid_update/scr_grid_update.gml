/// @description does not change storage levels
/// @param grid
var arg_grid = argument0;
with(arg_grid)
{
	for(var role = 0; role < macro_grid_role_count; role++)
	{
		var component_role_list = logic_map[? role];
		switch(role)
		{
			case macro_grid_role_consumer:
				total_demand = scr_grid_get_total(id, role);
				break;
			case macro_grid_role_source:
				total_production = scr_grid_get_total(id, role);
				break;
			case macro_grid_role_storage:
				scr_grid_update_storage(id);
				break;
		}
		net_output = total_production - total_demand;
	}
}