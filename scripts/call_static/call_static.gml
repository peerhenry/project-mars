/// @arg script
/// @arg method
/// @arg arguments...
function call_static(argument0, argument1, argument2) {
	var class = argument0;
	var func = argument1;
	var args = argument2;
	return call_class(class, noone, func, args);


}
