/// @param inventory
/// @param item_type
var arg_inventory = argument0;
var arg_item_type = argument1;

var width = arg_inventory.width;
var height = arg_inventory.height;
return ds_grid_value_exists(arg_inventory.space, 0, 0, width, height, arg_item_type);