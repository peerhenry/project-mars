/// @arg name
/// @arg array_of_signatures
var name = argument0;
var sigs = argument1;
if(!is_array(sigs)) scr_panic("arg needs to be an array of signatures");
return new_override(c_interface, obj_interface, name, sigs);