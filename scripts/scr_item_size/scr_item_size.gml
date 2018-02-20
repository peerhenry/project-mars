/// @param item
var arg_item = argument0;
if(arg_item == macro_inventory_rifle) return 2;
else if(arg_item == macro_inventory_food || arg_item == macro_inventory_module) return 4;
return 1;