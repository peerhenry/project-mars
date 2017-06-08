/// @param i
/// @param j
/// @param origin_i
/// @param origin_j
/// @param diff_i
/// @param diff_j
/// @param abs_diff_i
/// @param abs_diff_j
/// @param build
/// @param rotation

var arg_i = argument0;
var arg_j = argument1;
var arg_origin_i = argument2;
var arg_origin_j = argument3;
var arg_diff_i = argument4;
var arg_diff_j = argument5;
var arg_abs_diff_i = argument6;
var arg_abs_diff_j = argument7;
var arg_build = argument8;
var arg_rotation = argument9;

var tile_count = ds_map_find_value(global.build_tile_counts, arg_build);
var tile_offset = ds_map_find_value(global.build_tile_offsets, arg_build);
var build_tile_buffer = global.build_tile_buffer;
buffer_seek(build_tile_buffer, buffer_seek_start, tile_offset + 2*4); // skip the first two props (di, and dj); we know they're 0
var action_offset = buffer_read(build_tile_buffer, buffer_u32);
var action_count = buffer_read(build_tile_buffer, buffer_u32);

if(arg_abs_diff_i > arg_abs_diff_j) // horizontal cable
{
	var i_left = arg_origin_i + min(0, arg_diff_i);
	var i_right = arg_origin_i + max(arg_diff_i, 0);
	for(var tile_i = i_left; tile_i <= i_right; tile_i++)
	{
		scr_update_ghost_tile_with_overrides(tile_i, arg_origin_j, action_offset, action_count, arg_rotation, -1, 0,0);
	}
}
else	// vertical cable
{
	var j_top = arg_origin_j + min(0, arg_diff_j);
	var j_bottom = arg_origin_j + max(arg_diff_j, 0);
	for(var tile_j = j_top; tile_j <= j_bottom; tile_j++)
	{
		scr_update_ghost_tile_with_overrides(arg_origin_i, tile_j, action_offset, action_count, arg_rotation, -1, 1,0); // <= difference with drag cable
	}
}