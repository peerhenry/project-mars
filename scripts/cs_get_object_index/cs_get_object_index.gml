/// @arg class
var class = argument0;
var oi = void_static_unwrap(class, get_object_index);
if(oi == noone) scr_panic("object index is noone in cs_get_object_index for " + script_get_name(class));
return oi;