/// @param electric_grid
var arg_grid = argument0;

var sources = arg_grid[e_grid_source_list];
var total_power = 0;

for(var n = 0; n < ds_list_size(sources); n++)
{
	total_power -= ds_list_find_value(sources, n).electric_consumption;
}

return total_power;