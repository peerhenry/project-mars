/// @description does not change storage levels
/// @param grid
var arg_grid = argument0;

with(arg_grid)
{
	var storage_list = logic_map[? macro_grid_role_storage];
	var size = ds_list_size(storage_list);
	var total = 0;
	var stored = 0;
	for(var n = 0; n < size; n++)
	{
		var next_component = ds_list_find_value(storage_list, n);
		var grid_props = next_component.grid_props_map[? grid_type];
		if(grid_props[macro_grid_prop_can_perform_role])
		{
			var capacity = grid_props[macro_grid_prop_value];
			total += capacity;
			stored += capacity*grid_props[macro_grid_storage_level];
		}
	}
	storage_capacity = total;
	storage = stored;
}