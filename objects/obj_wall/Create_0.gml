scr_trace("wall create event");
event_inherited();

// Occupy navgrid and map buffer
scr_navgrid_occupy(occ_i, occ_j);
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall);

depth = -occ_j;	// set depth for tall structures
image_speed = 0;
if(!global.draw_tall_walls) sprite_index = spr_wall;
else sprite_index = spr_wall_tall;

// carrier of all grids
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_hydrogen, macro_grid_role_carrier, 0);

scr_set_basetile_lights(id);
scr_connect_to_cables(id);

// set wall image index, and also modify adjacent wall
var adj_walls = scr_get_adjacent_instances(id, obj_wall); // ENWS
for(var n = 0; n < 4; n++) // ENWS
{
	var next_wall = adj_walls[n];
	if(next_wall != noone)
	{
		var bit = power(2, n);
		if(image_index & bit != bit)
		{
			image_index += bit;
		}
		
		// check if adjacent wall has the bit
		var adj_bit = power(2, (n+2)%4);
		if(next_wall.image_index & adj_bit != adj_bit)
		{
			next_wall.image_index += adj_bit;
		}
	}
}
adj_walls = 0; // free array memory