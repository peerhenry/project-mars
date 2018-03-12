/// @param inventory
/// @param item_type
var arg_inventory = argument0;
var arg_item_type = argument1;

var width = arg_inventory.width;
var height = arg_inventory.height;

var item_x = ds_grid_value_x(arg_inventory.space, 0, 0, width, height, arg_item_type);
var item_y = ds_grid_value_y(arg_inventory.space, 0, 0, width, height, arg_item_type);
var item = ds_grid_get(arg_inventory.ids, item_x, item_y);
if(item == 0) return noone;