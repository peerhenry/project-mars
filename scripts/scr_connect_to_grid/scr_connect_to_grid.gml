/// @param component
/// @param grid_type
/// @param east_component
/// @param north_component
/// @param west_component
/// @param north_component
var arg_instance = argument0;
var arg_grid_type = argument1;
var arg_comp_east = argument2;
var arg_comp_north = argument3;
var arg_comp_west = argument4;
var arg_comp_south = argument5;

var grid_adj_number = 0;
	
var grid_east = noone;
var grid_north = noone;
var grid_west = noone;
var grid_south = noone;

if(arg_comp_east != noone && !arg_comp_east.under_construction)
{
	var east_grid_props = scr_get_grid_props(arg_comp_east, arg_grid_type);
	if(!is_undefined(east_grid_props))
	{
		grid_adj_number += macro_east_number;
		grid_east = east_grid_props[macro_grid_component_grid];
	}
}

if(arg_comp_north != noone && !arg_comp_north.under_construction)
{
	var north_grid_props = scr_get_grid_props(arg_comp_north, arg_grid_type);
	if(!is_undefined(north_grid_props))
	{
		grid_adj_number += macro_north_number;
		grid_north = north_grid_props[macro_grid_component_grid];
	}
}

if(arg_comp_west != noone && !arg_comp_west.under_construction)
{	
	var west_grid_props = scr_get_grid_props(arg_comp_west, arg_grid_type);
	if(!is_undefined(west_grid_props))
	{
		grid_adj_number += macro_west_number;
		grid_west = west_grid_props[macro_grid_component_grid];
	}
}

if(arg_comp_south != noone && !arg_comp_south.under_construction)
{
	var south_grid_props = scr_get_grid_props(arg_comp_south, arg_grid_type);
	if(!is_undefined(south_grid_props))
	{
		grid_adj_number += macro_south_number;
		grid_south = south_grid_props[macro_grid_component_grid];
	}
}

show_debug_message("JEBUB: ")
show_debug_message(string(grid_east));
show_debug_message(string(grid_north));
show_debug_message(string(grid_west));
show_debug_message(string(grid_south));

switch(grid_adj_number)
{
	// only one grid
	case 1:
		scr_grid_add(grid_east, arg_instance);
		return grid_east;
	case 2:
		scr_grid_add(grid_north, arg_instance);
		return grid_north;
	case 4:
		scr_grid_add(grid_west, arg_instance);
		return grid_west;
	case 8:
		scr_grid_add(grid_south, arg_instance);
		return grid_south;
	// two adjacent grids found
	case 3:	// E+N
		return scr_grid_add_2(arg_instance, grid_east, grid_north);
	case 5:	// E+W
		return scr_grid_add_2(arg_instance, grid_east, grid_west);
	case 9: // E+S
		return scr_grid_add_2(arg_instance, grid_east, grid_south);
	case 6: // N+W
		return scr_grid_add_2(arg_instance, grid_north, grid_west);
	case 10: // N+S
		return scr_grid_add_2(arg_instance, grid_north, grid_south);
	case 12: // W+S
		return scr_grid_add_2(arg_instance, grid_west, grid_south);
	// three grids found
	case 7:	// ENW
		return scr_grid_add_3(arg_instance, grid_east, grid_north, grid_west);
	case 11: // ENS
		return scr_grid_add_3(arg_instance, grid_east, grid_north, grid_south);
	case 13: // EWS
		return scr_grid_add_3(arg_instance, grid_east, grid_west, grid_south);
	case 14: // NWS
		return scr_grid_add_3(arg_instance, grid_north, grid_west, grid_south);
	// four grids
	case 15:
		return scr_grid_add_4(arg_instance, grid_east, grid_north, grid_west, grid_south);
}

return noone;