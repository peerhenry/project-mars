/// @param inventory
/// @param item
var arg_inventory = argument0;
var arg_item = argument1;

// Get size of item
var size = scr_item_size(arg_item);

var width = ds_grid_width(arg_inventory);
var height = ds_grid_height(arg_inventory);

if(size == 2)
{
	var item_x = ds_grid_value_x(arg_inventory, 0, 0, width-1, height-1, arg_item);
	var item_y = ds_grid_value_y(arg_inventory, 0, 0, width-1, height-1, arg_item);
	ds_grid_set_region(arg_inventory, item_x, item_y, item_x + 1, item_y + 1, macro_inventory_empty);
}
else
{
	var item_x = ds_grid_value_x(arg_inventory, 0, 0, width, height, arg_item);
	var item_y = ds_grid_value_y(arg_inventory, 0, 0, width, height, arg_item);
	ds_grid_set(arg_inventory, item_x, item_y, macro_inventory_empty);
}