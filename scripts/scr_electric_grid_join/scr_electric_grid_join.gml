/// @description adds grid_2 to grid_1
/// @param grid_1
/// @param grid_2

var arg_grid_1 = argument0;
var arg_grid_2 = argument1;

var carriers_1 = arg_grid_1[e_grid_carrier_list];
var carriers_2 = arg_grid_2[e_grid_carrier_list];
for(var n = 0; n < ds_list_size(carriers_2); n++)
{
	var next_carrier = ds_list_find_value(carriers_2, n);
	next_carrier.electric_grid = arg_grid_1;
}
scr_join_lists(carriers_1, carriers_2);

var sources_1 = arg_grid_1[e_grid_source_list];
var sources_2 = arg_grid_2[e_grid_source_list];
for(var n = 0; n < ds_list_size(sources_2); n++)
{
	var next_source = ds_list_find_value(sources_2, n);
	next_source.electric_grid = arg_grid_1;
}
scr_join_lists(sources_1, sources_2);

var consumers_1 = arg_grid_1[e_grid_consumer_list];
var consumers_2 = arg_grid_2[e_grid_consumer_list];
for(var n = 0; n < ds_list_size(consumers_2); n++)
{
	var next_consumer = ds_list_find_value(consumers_2, n);
	next_consumer.electric_grid = arg_grid_1;
}
scr_join_lists(consumers_1, consumers_2);

arg_grid_2 = 0;

return arg_grid_1;