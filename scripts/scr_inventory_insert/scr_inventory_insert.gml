/// @param inventory
/// @param item
var arg_inventory = argument0;
var arg_item = argument1;

var le_item_type = arg_item.type;
var size = arg_item.size;

// Find a space in astronaut inventory for item
var space = -1;
if(size == 2) space = scr_inventory_get_two_space(arg_inventory);
else if(size == 4) space = scr_inventory_get_big_space(arg_inventory);
else space = scr_inventory_get_space(arg_inventory);

if(space < 0) return false;

// Insert item into astronaut inventory
var inv_x = space >> 8;
var inv_y = space & 255;
if(size == 2)
{
	ds_grid_set_region(arg_inventory.space, inv_x, inv_y, inv_x + 1, inv_y, inv_space.occupied);
	ds_grid_set_region(arg_inventory.ids, inv_x, inv_y, inv_x + 1, inv_y, arg_item);
}
else if(size == 4)
{
	ds_grid_set_region(arg_inventory.space, inv_x, inv_y, inv_x + 1, inv_y + 1, inv_space.occupied);
	ds_grid_set_region(arg_inventory.ids, inv_x, inv_y, inv_x + 1, inv_y + 1, arg_item);
}
ds_grid_set(arg_inventory.ids, inv_x, inv_y, arg_item);
ds_grid_set(arg_inventory.space, inv_x, inv_y, le_item_type);

return true;