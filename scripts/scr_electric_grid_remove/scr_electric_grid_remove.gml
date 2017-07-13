/// @param electric_grid
/// @param instance
/*
var arg_grid = argument0;
var arg_instance = argument1;

var list_to_use = 0;

switch(arg_instance.electric_type)
{
	case electric.carrier:
		list_to_use = arg_grid[e_grid_carrier_list];
		break;
	case electric.source:
		list_to_use = arg_grid[e_grid_source_list];
		break;
	case electric.consumer:
		list_to_use = arg_grid[e_grid_consumer_list];
		break;
}

if(list_to_use != 0)
{
	var index = ds_list_find_index(list_to_use, arg_instance);
	ds_list_delete(list_to_use, index);
}

arg_instance.electric_grid = 0;
*/