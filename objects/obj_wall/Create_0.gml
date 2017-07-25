event_inherited();

// Occupy navgrid and map buffer
scr_navgrid_occupy(occ_i, occ_j);
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall);

depth = -occ_j;	// set depth for tall structures
image_speed = 0;

adjacency_numer = 0;

// carrier of all grids
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_carrier, 0);

scr_set_basetile_lights(id);

// set wall image index, and also modify adjacent wall
var adj_walls = scr_get_adjacent_instances(id, obj_wall);
for(var n = 0; n < 4; n++) // ENWS
{
	var next_wall = adj_walls[n];
	if(next_wall != noone)
	{
		var adj_bit = power(2, (n+2)%4);
		if(next_wall.image_index & adj_bit != adj_bit)
		{
			next_wall.image_index += adj_bit;
		}
		image_index += power(2, n);
	}
}

// DEBUG
var free = scr_navgrid_cell_is_free(occ_i, occ_j);
show_debug_message("i,j : " + string(occ_i) + ", " + string(occ_j));
show_debug_message("at the end of wall creation, cell is free: " + string(free));
alarm_set(0, 1);