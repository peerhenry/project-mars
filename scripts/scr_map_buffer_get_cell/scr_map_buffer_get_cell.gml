arg_i = argument0;
arg_j = argument1;

var byte_offset = (global.horizontal_cells*arg_j + arg_i)*2;
buffer_seek(global.map_buffer, buffer_seek_start, byte_offset);
return buffer_read(global.map_buffer, buffer_u16);