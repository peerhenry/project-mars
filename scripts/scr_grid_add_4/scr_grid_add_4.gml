/// @param instance
/// @param grid_1
/// @param grid_2
/// @param grid_3
/// @param grid_4

var arg_instance = argument0;
var arg_grid_1 = argument1;
var arg_grid_2 = argument2;
var arg_grid_3 = argument3;
var arg_grid_4 = argument4;

var equality_number = 0;

if(arg_grid_1 == arg_grid_2) equality_number += 1;
if(arg_grid_2 == arg_grid_3) equality_number += 2;
if(arg_grid_3 == arg_grid_4) equality_number += 4;
if(arg_grid_4 == arg_grid_1) equality_number += 8;

switch(equality_number)
{
	// all four grids are the same one
	case 15:
		scr_grid_add(arg_grid_1, arg_instance);
		return arg_grid_1;
	// two out of four grids are equal, twice; two distinct grids
	case 5:
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_3);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	case 10:
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_2);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	// three out of fout grids are equal; two distinct grids
	case 3:
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_4);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	case 6:
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_2);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	case 9:
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_3);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	case 12:
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_2);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	// two out of 4 grids are equal; three distinct grids
	case 1:	// G1 = G2
	case 2:	// G2 = G3
		var joined_grid = scr_grid_join_3(arg_grid_1, arg_grid_2, arg_grid_4);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	case 4: // G3 = G4
	case 8: // G4 = G1
		var joined_grid = scr_grid_join_3(arg_grid_1, arg_grid_2, arg_grid_3);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
}

// still need to check remaining grid equality options;
var equality_number = 0;
if(arg_grid_1 == arg_grid_3) equality_number += 1;
if(arg_grid_2 == arg_grid_4) equality_number += 2;

switch(equality_number)
{
	case 1:
		var joined_grid = scr_grid_join_3(arg_grid_1, arg_grid_2, arg_grid_4);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	case 2:
		var joined_grid = scr_grid_join_3(arg_grid_1, arg_grid_2, arg_grid_3);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
	case 3:
		var joined_grid = scr_grid_join(arg_grid_1, arg_grid_2);
		scr_grid_add(joined_grid, arg_instance);
		return joined_grid;
}

// all four grids are distinct
var joined_grid = scr_grid_join_4(arg_grid_1, arg_grid_2, arg_grid_3, arg_grid_4);
scr_grid_add(joined_grid, arg_instance);
return joined_grid;