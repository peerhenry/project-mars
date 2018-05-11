/// @arg class
var class = argument0;
var info_result = void_static(class, "get_class_info");
if( info_result.is_exception )
{
	instance_destroy(info_result);
	return [];
}
var info = unwrap(info_result);
var injection_names = void_unwrap(info, "get_injection_names");
destroy(info);
return injection_names;