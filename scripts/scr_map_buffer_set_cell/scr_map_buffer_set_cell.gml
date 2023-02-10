/// @param i
/// @param j
/// @param value
function scr_map_buffer_set_cell(argument0, argument1, argument2) {

	arg_i = argument0;
	arg_j = argument1;

	var byte_offset = (global.horizontal_cells*arg_j + arg_i)*2;
	buffer_seek(global.map_buffer, buffer_seek_start, byte_offset);
	buffer_write(global.map_buffer, buffer_u16, argument2);


}
