/// @descr call method in each element of the array
/// @arg array
/// @arg method
var array = argument0;
var method= argument1;
var output = [];
for(var n = 0; n < array_length_1d(array); n++)
{
	var elem = array[n];
	var mapped = call_unwrap(elem, method);
	output[n] = mapped;
}
return output;