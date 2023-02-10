/// @arg entity
function scr_step_nav_grid(argument0) {
	var arg_entity = argument0;

	with(arg_entity)
	{
		//mp_grid_add_cell(navgrid, occ_i, occ_j); // dirty fix for when another astronaut walks across this one to prevent this cell from being cleared
		if(path_exists(path))
		{
			// update navgrid
			var navgrid = scr_get_nav_grid();
			var current_i = scr_rc_to_gi(x);
			var current_j = scr_rc_to_gi(y);
			if(current_i != occ_i || current_j != occ_j)
			{
				var clear_prev = scr_navgrid_should_clear_after_astro_pass(id, occ_i, occ_j);
				if(clear_prev)
				{
					mp_grid_clear_cell(navgrid, occ_i, occ_j);
				}
				occ_i = current_i;
				occ_j = current_j;
				depth = -occ_j;
			}
			mp_grid_add_cell(navgrid, occ_i, occ_j);
		}
	}


}
