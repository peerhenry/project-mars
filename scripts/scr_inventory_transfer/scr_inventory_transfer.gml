/// @param inventory_from
/// @param inventory_to
/// @param item_type
var arg_inv_from = argument0;
var arg_inv_to = argument1;
var arg_item_type = argument2;

// check if inv_from has item
var has_item_type = scr_inventory_has_item_type(arg_inv_from, arg_item_type);
if(!has_item_type) return false;

// check if inv_to has space for item
var has_space = scr_inventory_has_space_for_item_type(arg_inv_to, arg_item_type);
if(!has_space) return false;

var item = scr_inventory_extract(arg_inv_from, arg_item_type);
var success = scr_inventory_insert(arg_inv_to, item);
if(item == noone || !success) show_error("item transfer failure while it should be possible", true);
else if(item.type != arg_item_type) show_error("invalid item type", true);
return true;