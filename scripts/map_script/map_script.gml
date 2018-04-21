/// @arg array
/// @arg script
var array = argument0;
var script = argument1;
var output = [];
for(var n = 0; n < array_length_1d(array); n++)
{
	var elem = array[n];
	var mapped = script_execute(script, elem);
	output[n] = mapped;
}
return output;