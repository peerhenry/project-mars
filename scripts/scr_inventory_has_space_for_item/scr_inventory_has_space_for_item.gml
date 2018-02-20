/// @param inventory
/// @param item
var arg_inventory = argument0;
var arg_item = argument1;

var size = scr_item_size(arg_item);
if(size == 4) return scr_inventory_has_big_space(arg_inventory);
if(size == 2) return scr_inventory_has_two_space(arg_inventory);
return scr_inventory_has_space(arg_inventory);