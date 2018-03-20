/// @param inventory
/// @param inventory_x
/// @param inventory_y
var arg_inventory = argument0;
var arg_x = argument1;
var arg_y = argument2;

var item = ds_grid_get(arg_inventory.ids, arg_x, arg_y); //warning: ds_grid_get returns "undefined" when arguments are out of bounds (does not return "0" like manual says) //todo: report to yoyo games?
if(is_undefined(item) || item <= 0) return noone;
return item;