/// @arg script
/// @arg method
/// @arg arguments...
var class = argument0;
var method = argument1;
var args = argument2;
return unwrap(call_class(class, noone, method, args));