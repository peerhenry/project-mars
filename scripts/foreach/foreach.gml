/// @arg array
/// @arg instance
/// @arg method
var array = argument0;
var thing = argument1;
var method = argument2;
for(var n = 0; n < array_length_1d(array); n++)
{
	var elem = array[n];
	call_unwrap(thing, method, elem);
}