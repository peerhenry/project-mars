/// @descrtiption checks if a 2x2 area is free within astronauts 3x3 grid
/// @param astronaut
var arg_astronaut = argument0;

// No square can be free if center cell is not free
if(ds_grid_get(inventory, 1, 1) != macro_inventory_empty) return false;

with(arg_astronaut)
{
	var top = ds_grid_get(inventory, 1, 0) == macro_inventory_empty;
	var bottom = ds_grid_get(inventory, 1, 2) == macro_inventory_empty;
	if(!(top||bottom)) return false;	// No square can be free if neither center top or center bottom cells are free
	var left = ds_grid_get(inventory, 0, 1) == macro_inventory_empty;
	var right = ds_grid_get(inventory, 2, 1) == macro_inventory_empty;
	if(!(left||right)) return false;	// No square can be free if neither middle right or middle left cells are free
	var top_left_can_be_free = top && left;
	var top_right_can_be_free = top && right;
	var bottom_left_can_be_free = bottom && left;
	var bottom_right_can_be_free = bottom && right;
	
	if(top_left_can_be_free)
	{
		if(ds_grid_get(inventory, 0, 0) == macro_inventory_empty) return true;
	}
	if(top_right_can_be_free)
	{
		if(ds_grid_get(inventory, 2, 0) == macro_inventory_empty) return true;
	}
	if(bottom_left_can_be_free)
	{
		if(ds_grid_get(inventory, 0, 2) == macro_inventory_empty) return true;
	}
	if(bottom_right_can_be_free)
	{
		if(ds_grid_get(inventory, 2, 2) == macro_inventory_empty) return true;
	}
}

return false;