/// @arg object_index
function scr_count_instances_strict(argument0) {
	var count = 0;
	with(argument0)
	{
		if(object_index == argument0) count++;
	}
	return count;


}
