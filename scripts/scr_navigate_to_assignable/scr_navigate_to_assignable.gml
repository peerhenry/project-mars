function scr_navigate_to_assignable(argument0, argument1) {
	// tries to navigate and returns reach state
	/// @param component
	/// @param entity
	var arg_component = argument0;
	var arg_entity = argument1;

	var state = reach_state.unreachable;

	var ass_i = arg_component.occ_i;
	var ass_j = arg_component.occ_j;
	var astro_i = arg_entity.occ_i;
	var astro_j = arg_entity.occ_j;
		
	var already_adjacent = (astro_i == ass_i && abs(astro_j - ass_j) == 1)
		|| (astro_j == ass_j && abs(astro_i - ass_i) == 1);
		
	if(already_adjacent)
	{
		state = reach_state.adjacent; // no need to navigate
	}
	else // Try to navigate to any cell adjacent to the component
	{
		// Get all adjacent cells (warning: incomplete for constructions with multiple cells)
		with(arg_entity)
		{
			scr_navgrid_clear_cell(occ_i, occ_j);
		}
		
		var free_spots = ds_list_create();
		var spots = scr_get_assignable_spots(arg_component, arg_entity);
		for(var n = 0; n < array_length_1d(spots); n++)
		{
			var next_spot = spots[n];
			var spot_i = scr_decode_grid_coord_i(next_spot);
			var spot_j = scr_decode_grid_coord_j(next_spot);
			if( scr_navgrid_cell_is_free(spot_i, spot_j) )
			{
				ds_list_add(free_spots, next_spot);
			}
		}
		
		var n = 0;
		var can_assign = false;
		while(!can_assign && n < ds_list_size(free_spots))
		{
			var next_spot = free_spots[|n];
			var spot_i = scr_decode_grid_coord_i(next_spot);
			var spot_j = scr_decode_grid_coord_j(next_spot);
			var s_x = scr_gi_to_rc(spot_i);
			var s_y = scr_gi_to_rc(spot_j);
			can_assign = scr_navigate_once(arg_entity, s_x, s_y);
			n++;
		}
		if(can_assign) state = reach_state.reachable;
		
		with(arg_entity)
		{
			scr_navgrid_occupy(occ_i, occ_j);
		}
		
		ds_list_destroy(free_spots);
	}

	return state;


}
