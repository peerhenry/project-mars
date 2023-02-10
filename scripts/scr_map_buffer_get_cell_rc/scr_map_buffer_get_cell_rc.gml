function scr_map_buffer_get_cell_rc(argument0, argument1) {
	arg_x = argument0;
	arg_y = argument1;
	arg_i = scr_rc_to_gi(arg_x);
	arg_j = scr_rc_to_gi(arg_y);

	return scr_map_buffer_get_cell(arg_i, arg_j);


}
