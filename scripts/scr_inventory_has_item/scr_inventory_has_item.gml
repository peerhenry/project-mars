/// @param inventory
/// @param item
var arg_inventory = argument0;
var arg_item = argument1;

var width = ds_grid_width(arg_inventory);
var height = ds_grid_height(arg_inventory);
return ds_grid_value_exists(arg_inventory, 0, 0, width, height, arg_item);