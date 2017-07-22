/// @param inventory
/// @param item
var arg_inventory = argument0;
var arg_item = argument1;

// Get size of item
var size = scr_item_size(arg_item);

// Find a space in astronaut inventory for item
var space = -1;
if(size == 2) space = scr_inventory_get_big_space(arg_inventory);
else space = scr_inventory_get_space(arg_inventory);

if(space < 0) return false;

// Insert item into astronaut inventory
var inv_x = space >> 8;
var inv_y = space & 255;
show_debug_message("INSERTING INTO: " + string(inv_x) + " " + string(inv_y));
if(size == 2)
{
	ds_grid_set_region(arg_inventory, inv_x, inv_y, inv_x + 1, inv_y + 1, macro_inventory_occupied);
}
ds_grid_set(arg_inventory, inv_x, inv_y, arg_item);

return true;