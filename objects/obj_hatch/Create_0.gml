event_inherited();

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall_like);

depth = -occ_j;	// set depth for tall structures

var adj_walls = scr_get_adjacent_instances(id, obj_wall);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_wall = adj_walls[n];
	if(next_wall != noone)
	{
		next_wall.image_index += power(2, (n+2)%4);
	}
}