/// @descr unwraps the value and throws away result
/// @arg instance
/// @arg method
/// @arg arguments_array
function call_unwrap(argument0, argument1, argument2) {
	var instance = argument0;
	var func = argument1;
	var arguments = argument2;
	var result = call(instance, func, arguments);
	return unwrap(result);


}
