/// @param astronaut
/// @param item
var arg_astronaut = argument0;
var arg_item = argument1;

var inventory = arg_astronaut.inventory;

// Get size of item
var size = 1;
if(arg_item == macro_inventory_food || arg_item == macro_inventory_module) size = 2;

// Find a space in astronaut inventory for item
var space = -1;
if(size == 2)
{
	var food_x = ds_grid_value_x(inventory, 0, 0, 1, 1, arg_item);
	var food_y = ds_grid_value_y(inventory, 0, 0, 1, 1, arg_item);
	ds_grid_set_region(inventory, food_x, food_y, food_x + 1, food_y + 1, macro_inventory_empty);
}
else
{
	var item_x = ds_grid_value_x(inventory, 0, 0, 2, 2, arg_item);
	var item_y = ds_grid_value_y(inventory, 0, 0, 2, 2, arg_item);
	ds_grid_set(inventory, food_x, food_y, macro_inventory_empty);
}

if(space < 0) return false;

// Insert item into astronaut inventory
var inv_x = space >> 2;
var inv_y = space & 3;
if(size == 2)
{
	ds_grid_set_region(inventory, inv_x, inv_y, inv_x + 1, inv_y + 1, macro_inventory_occupied);
}
ds_grid_set(inventory, inv_x, inv_y, arg_item);

return true;