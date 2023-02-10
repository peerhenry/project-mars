/// @arg pipe
function scr_connect_pipe(argument0) {
	var arg_pipe = argument0;
	with(arg_pipe)
	{
		var adjacents = scr_get_adjacent_grid_components(id, macro_grid_water);
		for(var n = 0; n < 4; n++) // ENWS
		{
			var next_adjacent = adjacents[n];
			if(next_adjacent != noone)
			{
				pipe_adjacency += power(2, n);
				if(next_adjacent.object_index == obj_pipe)
				{
					next_adjacent.pipe_adjacency += power(2, (n+2)%4);
					scr_set_pipe_image(next_adjacent);
				}
			}
		}
	}


}
