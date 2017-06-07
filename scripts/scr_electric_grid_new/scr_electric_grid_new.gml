/// @description
/// @param instance

var arg_instance = argument0;

var consumer_list = ds_list_create();
var source_list = ds_list_create();
var carrier_list = ds_list_create();

var new_electric_grid;
new_electric_grid[e_grid_net_power] = -arg_instance.electric_consumption;
new_electric_grid[e_grid_consumer_list] = consumer_list;	// highest array index first.
new_electric_grid[e_grid_source_list] = source_list;
new_electric_grid[e_grid_carrier_list] = carrier_list;

scr_electric_grid_add(new_electric_grid, arg_instance);

return new_electric_grid;