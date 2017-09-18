/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	var navgrid = scr_get_nav_grid();
	mp_grid_add_cell(navgrid, occ_i, occ_j); // dirty fix for when astronaut walks across another astronaut
	if(is_walking)
	{
		// update navgrid
		var current_i = scr_rc_to_gi(x);
		var current_j = scr_rc_to_gi(y);
		if(current_i != occ_i || current_j != occ_j)
		{
			mp_grid_clear_cell(navgrid, occ_i, occ_j); // todo: call a script with a check to clear cell
			prev_i = occ_i;
			prev_j = occ_j;	
			occ_i = current_i;
			occ_j = current_j;
			mp_grid_add_cell(navgrid, occ_i, occ_j);
		}
	}
}