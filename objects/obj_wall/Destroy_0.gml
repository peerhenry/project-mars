event_inherited();
scr_navgrid_clear_cell( occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear);
scr_remove_basetile_lights(id);

// update image index of adjacent walls
var adj_walls = scr_get_adjacent_instances(id, obj_wall);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_wall = adj_walls[n];
	if(next_wall != noone)
	{
		next_wall.image_index -= power(2, (n+2)%4);
	}
}