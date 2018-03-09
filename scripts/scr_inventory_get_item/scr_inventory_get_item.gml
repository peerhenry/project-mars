/// @param inventory
/// @param grid_x
/// @param grid_y
var arg_inventory = argument0;
var arg_x = argument1;
var arg_y = argument2;

var item = ds_grid_get(arg_inventory.ids, arg_x, arg_y);
if(item == 0) return noone;