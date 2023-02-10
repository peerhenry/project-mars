/// @arg array
/// @arg separator
function scr_flatten_string_array() {
	var array = argument[0];
	var al = scr_length(array);
	if(al == 0) return "";

	var separator = (argument_count == 2) ? argument[1] : "";
	var next = array[0];
	var aggr = next;
	for(var n = 1; n < al; n++)
	{
		next = array[1];
		aggr = aggr + separator + next;
	}

	return aggr;


}
