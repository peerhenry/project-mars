/// @param electric_grid
var arg_grid = argument0;

var consumers = arg_grid[e_grid_consumer_list];
var total_consumption = 0;

for(var n = 0; n < ds_list_size(consumers); n++)
{
	total_consumption += ds_list_find_value(consumers, n).electric_consumption;
}

return total_consumption;