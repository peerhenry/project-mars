/// @descr call a method in each element of the array
/// @arg array
/// @arg method
function ineach(argument0, argument1, argument2) {
	var array = argument0;
	var func = argument1;
	var args = argument2;
	for(var n = 0; n < array_length_1d(array); n++)
	{
		var elem = array[n];
		call_unwrap(elem, func, args);
	}


}
