var contains = ds_list_find_index(argument0, argument1) >= 0;
var el = string(argument1);
if(object_exists(argument1)) el = object_get_name(argument1.object_index);
if(!contains) show_debug_message("Test failed: list did not contain " + el);
return contains;