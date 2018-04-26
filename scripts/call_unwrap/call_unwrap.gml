/// @descr unwraps the value and throws away result
/// @arg instance
/// @arg method
/// @arg arguments_array
var instance = argument0;
var method = argument1;
var arguments = argument2;
var result = call(instance, method, arguments);
return unwrap(result);