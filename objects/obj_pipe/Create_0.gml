event_inherited();

scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_carrier, 0);

// Connect pipe to water grid components
// determine adjacency number and set image index
var adjacents = scr_get_adjacent_grid_components(id, macro_grid_water);
var adjacent_pipes = scr_get_adjacent_instances(id, obj_pipe);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_adjacent = adjacents[n];
	if(adjacent_pipes[n] != noone) next_adjacent = adjacent_pipes[n];
	if(next_adjacent != noone)
	{
		adjacency_number += power(2, n);
		if(next_adjacent.object_index == obj_pipe)
		{
			next_adjacent.adjacency_number += power(2, (n+2)%4);
			scr_set_pipe_image(next_adjacent);
		}
	}
}

scr_set_pipe_image(id);

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.pipe);