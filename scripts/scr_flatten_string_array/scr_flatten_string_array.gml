/// @arg array
/// @arg separator
var array = argument[0];
var array_length = scr_length(array);
if(array_length == 0) return "";

var separator = (argument_count == 2) ? argument[1] : "";
var next = array[0];
var aggr = next;
for(var n = 1; n < array_length; n++)
{
	next = array[1];
	aggr = aggr + separator + next;
}

return aggr;