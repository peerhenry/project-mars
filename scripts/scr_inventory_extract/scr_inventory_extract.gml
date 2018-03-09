/// @param inventory
/// @param item_type
var arg_inventory = argument0;
var arg_item_type = argument1;

// Get size of item
var size = scr_item_type_size(arg_item_type);

var width = arg_inventory.width;
var height = arg_inventory.height;

if(!ds_grid_value_exists(arg_inventory.space, 0, 0, width-1, height-1, arg_item_type))
{
	return noone;
}

var item = noone;

if(size == 2)
{
	var item_x = ds_grid_value_x(arg_inventory.space, 0, 0, width-1, height-1, arg_item_type);
	var item_y = ds_grid_value_y(arg_inventory.space, 0, 0, width-1, height-1, arg_item_type);
	ds_grid_set_region(arg_inventory.space, item_x, item_y, item_x + 1, item_y, inv_space.empty);
	
	item = ds_grid_get(arg_inventory.ids, item_x, item_y);
	ds_grid_set_region(arg_inventory.ids, item_x, item_y, item_x + 1, item_y, 0);
}
else if(size == 4)
{
	var item_x = ds_grid_value_x(arg_inventory.space, 0, 0, width-1, height-1, arg_item_type);
	var item_y = ds_grid_value_y(arg_inventory.space, 0, 0, width-1, height-1, arg_item_type);
	ds_grid_set_region(arg_inventory.space, item_x, item_y, item_x + 1, item_y + 1, inv_space.empty);
	
	item = ds_grid_get(arg_inventory.ids, item_x, item_y);
	ds_grid_set_region(arg_inventory.ids, item_x, item_y, item_x + 1, item_y + 1, 0);
}
else
{
	var item_x = ds_grid_value_x(arg_inventory.space, 0, 0, width, height, arg_item_type);
	var item_y = ds_grid_value_y(arg_inventory.space, 0, 0, width, height, arg_item_type);
	ds_grid_set(arg_inventory.space, item_x, item_y, inv_space.empty);
	
	item = ds_grid_get(arg_inventory.ids, item_x, item_y);
	ds_grid_set(arg_inventory.ids, item_x, item_y, 0);
}

return item;