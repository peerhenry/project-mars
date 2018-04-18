/// @descr call a method in each element of the array
/// @arg array
/// @arg method
var array = argument0;
var method = argument1;
for(var n = 0; n < array_length_1d(array); n++)
{
	var elem = array[n];
	call_unwrap(elem, method);
}