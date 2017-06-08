var arg_instance = argument0;
var arg_x = arg_instance.x;
var arg_y = arg_instance.y;

var grid_adj_number = 0;

var comp_east = instance_position(arg_x + 32, arg_y, obj_electric_component);
var grid_east = noone;
if(comp_east > 0 && (comp_east.y - arg_y < 16) && is_array(comp_east.electric_grid))
{
	grid_east = comp_east.electric_grid;
	grid_adj_number += 1;
}

var comp_north = instance_position(arg_x, arg_y  - 32, obj_electric_component);
var grid_north = noone;
if(comp_north > 0 && (comp_north.y - (arg_y-32) < 16) && is_array(comp_north.electric_grid))
{
	grid_north = comp_north.electric_grid;
	grid_adj_number += 2;
}

var comp_west = instance_position(arg_x - 32, arg_y, obj_electric_component);
var grid_west = noone;
if(comp_west > 0 && (comp_west.y - arg_y < 16) && is_array(comp_west.electric_grid))
{
	grid_west = comp_west.electric_grid;
	grid_adj_number += 4;
}

var comp_south = instance_position(arg_x, arg_y + 32, obj_electric_component);
var grid_south = noone;
if(comp_south > 0 && (comp_south.y - (arg_y+32) < 16) && is_array(comp_south.electric_grid))
{
	grid_south = comp_south.electric_grid;
	grid_adj_number += 8;
}

switch(grid_adj_number)
{
	// only one grid
	case 1:
		scr_electric_grid_add(grid_east, arg_instance);
		return grid_east;
	case 2:
		scr_electric_grid_add(grid_north, arg_instance);
		return grid_north;
	case 4:
		scr_electric_grid_add(grid_west, arg_instance);
		return grid_west;
	case 8:
		scr_electric_grid_add(grid_south, arg_instance);
		return grid_south;
	// two adjacent grids found
	case 3:	// E+N
		return scr_two_grids_add(arg_instance, grid_east, grid_north);
	case 5:	// E+W
		return scr_two_grids_add(arg_instance, grid_east, grid_west);
	case 9: // E+S
		return scr_two_grids_add(arg_instance, grid_east, grid_south);
	case 6: // N+W
		return scr_two_grids_add(arg_instance, grid_north, grid_west);
	case 10: // N+S
		return scr_two_grids_add(arg_instance, grid_north, grid_south);
	case 12: // W+S
		return scr_two_grids_add(arg_instance, grid_west, grid_south);
	// three grids found
	case 7:	// ENW
		return scr_three_grids_add(arg_instance, grid_east, grid_north, grid_west);
	case 11: // ENS
		return scr_three_grids_add(arg_instance, grid_east, grid_north, grid_south);
	case 13: // EWS
		return scr_three_grids_add(arg_instance, grid_east, grid_west, grid_south);
	case 14: // NWS
		return scr_three_grids_add(arg_instance, grid_north, grid_west, grid_south);
	// four grids
	case 15:
		return scr_four_grids_add(arg_instance, grid_east, grid_north, grid_west, grid_south);
}

return noone;