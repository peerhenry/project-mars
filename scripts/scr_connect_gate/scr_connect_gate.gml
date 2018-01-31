/// @arg gate
with(argument0)
{
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
		}
	}
	
	if(object_index == obj_door)
	{
		if(connects_horizontally)
		{
			if(!global.draw_tall_walls) sprite_index = spr_door_vertical;
			else sprite_index = spr_door_tall_vertical;
		}
		else
		{
			if(!global.draw_tall_walls) sprite_index = spr_door;
			else sprite_index = spr_door_tall;
		}
	}
	else if(object_index == obj_hatch)
	{
		if(connects_horizontally)
		{
			scr_execute_map_buffer_action(occ_i + 1, occ_j, map_buffer_action.reserve);
			scr_execute_map_buffer_action(occ_i - 1, occ_j, map_buffer_action.reserve);
			if(!global.draw_tall_walls) sprite_index = spr_hatch_vertical;
			else sprite_index = spr_hatch_tall_vertical;
		}
		else
		{
			scr_execute_map_buffer_action(occ_i, occ_j + 1, map_buffer_action.reserve);
			scr_execute_map_buffer_action(occ_i, occ_j - 1, map_buffer_action.reserve);
			if(!global.draw_tall_walls) sprite_index = spr_hatch;
			else sprite_index = spr_hatch_tall;
		}
	}
}