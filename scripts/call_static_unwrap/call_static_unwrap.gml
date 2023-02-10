/// @arg script
/// @arg method
/// @arg arguments...
function call_static_unwrap(argument0, argument1, argument2) {
	var class = argument0;
	var func = argument1;
	var args = argument2;
	return unwrap(call_class(class, noone, func, args));


}
