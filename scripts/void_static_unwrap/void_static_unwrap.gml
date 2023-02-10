/// @arg script
/// @arg method
function void_static_unwrap(argument0, argument1) {
	var class = argument0;
	var func = argument1;
	var res = call_class(class, noone, func, []);
	return unwrap(res);


}
