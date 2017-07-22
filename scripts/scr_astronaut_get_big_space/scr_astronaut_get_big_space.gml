/// @descrtiption checks if a 2x2 area is free within astronauts 3x3 grid
/// @param astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	// No square can be free if center cell is not free
	if(ds_grid_get(inventory, 1, 1) != macro_inventory_empty) return -1;

	var top = ds_grid_get(inventory, 1, 0) == macro_inventory_empty;
	var bottom = ds_grid_get(inventory, 1, 2) == macro_inventory_empty;
	if(!(top||bottom)) return -1;	// No square can be free if neither center top or center bottom cells are free
	var left = ds_grid_get(inventory, 0, 1) == macro_inventory_empty;
	var right = ds_grid_get(inventory, 2, 1) == macro_inventory_empty;
	if(!(left||right)) return -1;	// No square can be free if neither middle right or middle left cells are free
	var top_left_can_be_free = top && left;
	var top_right_can_be_free = top && right;
	var bottom_left_can_be_free = bottom && left;
	var bottom_right_can_be_free = bottom && right;
	
	if(top_left_can_be_free)
	{
		if(ds_grid_get(inventory, 0, 0) == macro_inventory_empty) return macro_astronaut_inventory_0_0;
	}
	if(top_right_can_be_free)
	{
		if(ds_grid_get(inventory, 2, 0) == macro_inventory_empty) return macro_astronaut_inventory_1_0; // x=1, y=0
	}
	if(bottom_left_can_be_free)
	{
		if(ds_grid_get(inventory, 0, 2) == macro_inventory_empty) return macro_astronaut_inventory_0_1;
	}
	if(bottom_right_can_be_free)
	{
		if(ds_grid_get(inventory, 2, 2) == macro_inventory_empty) return macro_astronaut_inventory_1_1;
	}
}

return -1;