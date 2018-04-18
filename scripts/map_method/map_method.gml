/// @arg array
/// @arg instance
/// @arg method
var array = argument0;
var thing = argument1;
var method = argument2;
var output = [];
for(var n = 0; n < array_length_1d(array); n++)
{
	var elem = array[n];
	var mapped = call_unwrap(thing, method, elem);
	output[n] = mapped;
}
return output;