/// @arg component
var arg_comp = argument0;
var adjacent_pipes = scr_get_adjacent_instances(arg_comp, obj_pipe);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_adjacent = adjacent_pipes[n];
	if(next_adjacent != noone)
	{
		var bit = power(2, (n+2)%4);
		if(next_adjacent.adjacency_number & bit == 0)
		{
			next_adjacent.adjacency_number += bit;
			scr_set_pipe_image(next_adjacent);
		}
	}
}