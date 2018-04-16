/// @arg array_name_returntype_argtypes
var arg = argument0;
if(!is_array(arg)) scr_panic("arg needs to be an array of signatures");
return new_override(c_interface, obj_interface, arg);