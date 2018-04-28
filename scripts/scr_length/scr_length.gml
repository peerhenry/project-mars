/// @descr Length resolver for array or list
/// @arg array_or_list
var thing = argument0;
if(is_array(thing)) return array_length_1d(thing);
else ds_list_size(thing);