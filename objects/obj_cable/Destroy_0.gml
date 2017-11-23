event_inherited();
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear_cable);
scr_disconnect_from_cables(id);

var adjacents = scr_get_adjacent_grid_components(id, macro_grid_electric);
for(var n = 0; n<4; n++)
{
	var next = adjacents[n];
	if(next != noone)
	{
		var bit = power(2, (n+2)%4);
		with(next)
		{
			if(cable_adjacency & bit != 0)
			{
				cable_adjacency -= bit;
			}
		}
	}
}