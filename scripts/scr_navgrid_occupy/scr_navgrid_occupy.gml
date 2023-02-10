/// @param i
/// @param j
function scr_navgrid_occupy(argument0, argument1) {

	var navgrid = scr_get_nav_grid();
	if(navgrid >= 0) mp_grid_add_cell(navgrid, argument0, argument1);


}
