/// @arg instance
/// @arg method
function void_unwrap(argument0, argument1) {
	var instance = argument0;
	var func = argument1;
	var result = call(instance, func, []);
	return unwrap(result);


}
