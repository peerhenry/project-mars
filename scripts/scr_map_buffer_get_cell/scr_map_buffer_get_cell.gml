/// @arg i
/// @arg j
var arg_i = argument0;
var arg_j = argument1;
var buff = global.map_buffer;
var byte_offset = (global.horizontal_cells*arg_j + arg_i)*2;
buffer_seek(buff, buffer_seek_start, byte_offset);
return buffer_read(buff, buffer_u16);