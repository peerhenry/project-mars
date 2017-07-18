var arg_instance = argument0;

var should_update_adjacent_cables = false;

with(arg_instance)
{
	switch(object_index)
	{
		case obj_pipe:
			depth -= 1; // pipes should appear on top of cables
			break;
		default:
			break;
	}
}