/// @arg instance
function scr_find_free_spot_around(argument0) {
	// todo: change code for multicell things like bed.
	var arg_instance = argument0;
	var ii = occ_i;
	var jj = occ_j;
	with(arg_instance)
	{
		ii = occ_i + 1;
		if( scr_navgrid_cell_is_free(ii, jj) ) return scr_encode_grid_coord(ii, jj);
		ii = occ_i - 1;
		if( scr_navgrid_cell_is_free(ii, jj) ) return scr_encode_grid_coord(ii, jj);
		ii = occ_i;
		jj = occ_j + 1;
		if( scr_navgrid_cell_is_free(ii, jj) ) return scr_encode_grid_coord(ii, jj);
		jj = occ_j - 1;
		if( scr_navgrid_cell_is_free(ii, jj) ) return scr_encode_grid_coord(ii, jj);
	}
	return -1;


}
