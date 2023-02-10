/// @param i
/// @param j
function scr_navgrid_cell_is_free(argument0, argument1) {
	return mp_grid_get_cell(scr_get_nav_grid(), argument0, argument1) == 0;


}
