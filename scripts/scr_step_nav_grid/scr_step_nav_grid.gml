/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	//mp_grid_add_cell(navgrid, occ_i, occ_j); // dirty fix for when another astronaut walks across this one to prevent this cell from being cleared
	if(is_walking)
	{
		// update navgrid
		var navgrid = scr_get_nav_grid();
		var current_i = scr_rc_to_gi(x);
		var current_j = scr_rc_to_gi(y);
		if(current_i != occ_i || current_j != occ_j)
		{
			if(scr_navgrid_should_clear_after_astro_pass(occ_i, occ_j))
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