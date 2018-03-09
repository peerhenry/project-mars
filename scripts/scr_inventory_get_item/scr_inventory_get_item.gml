/// @param inventory
/// @param inventory_x
/// @param inventory_y
var arg_inventory = argument0;
var arg_x = argument1;
var arg_y = argument2;

var item = ds_grid_get(arg_inventory.ids, arg_x, arg_y);
if(item <= 0) return noone;
else return item;