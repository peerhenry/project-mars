/// @param grid
/// @param role
var arg_grid = argument0;
var arg_role = argument1;

var component_role_list = arg_grid.role_map[? arg_role];
var size = ds_list_size(component_role_list);
var total = 0;
for(var n = 0; n < size; n++)
{
	var next_component = ds_list_find_value(component_role_list, n);
	var grid_props = next_component.grid_props_map[? grid_type];
	if(grid_props[macro_grid_component_can_perform_role])
	{
		total += grid_props[macro_grid_component_value];
	}
}
return total;