/// @param inventory_from
/// @param inventory_to
/// @param item
var arg_inv_from = argument0;
var arg_inv_to = argument1;
var arg_item = argument2;
show_debug_message("TRANSFERRING...");
// check if inv_from has item
var has_item = scr_inventory_has_item(arg_inv_from, arg_item);
if(!has_item) return false;

// check if inv_to has space for item
var has_space = scr_inventory_has_space_for_item(arg_inv_to, arg_item);
if(!has_space) return false;
show_debug_message("has_space: " + string(has_space));

scr_inventory_extract(arg_inv_from, arg_item);
scr_inventory_insert(arg_inv_to, arg_item);
return true;