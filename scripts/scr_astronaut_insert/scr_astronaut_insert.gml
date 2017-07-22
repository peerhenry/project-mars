/// @param astronaut
/// @param item
var arg_astronaut = argument0;
var arg_item = argument1;

// Get size of item
var size = 1;
if(arg_item == macro_inventory_food || arg_item == macro_inventory_module) size = 2;

// Find a space in astronaut inventory for item
var space = -1;
if(size == 2) space = scr_astronaut_get_big_space(arg_astronaut);
else space = scr_astronaut_get_space(arg_astronaut);

if(space < 0) return false;

// Insert item into astronaut inventory
with(arg_astronaut)
{
	var inv_x = space >> 2;
	var inv_y = space & 3;
	if(size == 2)
	{
		ds_grid_set_region(inventory, inv_x, inv_y, inv_x + 1, inv_y + 1, macro_inventory_occupied);
	}
	ds_grid_set(inventory, inv_x, inv_y, arg_item);
}

return true;