/// @arg instance
/// @arg method
/// @arg arguments...
function call(argument0, argument1, argument2) {
	var instance = argument0;
	var func = argument1;
	var args = argument2;
	return call_class(instance.class, instance, func, args);


}
