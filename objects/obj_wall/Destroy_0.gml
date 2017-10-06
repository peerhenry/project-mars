event_inherited();
scr_navgrid_clear_cell( occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear);
scr_remove_basetile_lights(id);

if(position_meeting(x, y, obj_gate)) exit;

// If wall isn't being replaced by a gate, update image index of adjacent walls
var adj_walls = scr_get_adjacent_instances(id, obj_wall);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_wall = adj_walls[n];
	if(next_wall != noone)
	{
		var remove_bit = power(2, (n+2)%4)
		if(image_index & remove_bit == remove_bit)
		{
			next_wall.image_index -= remove_bit;
		}
	}
}