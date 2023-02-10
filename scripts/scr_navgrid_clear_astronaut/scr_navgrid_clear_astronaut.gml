/// @param astronaut
function scr_navgrid_clear_astronaut(argument0) {
	var arg_astronaut = argument0;

	with(arg_astronaut)
	{
		scr_navgrid_clear_cell(occ_i, occ_j);
	}


}
