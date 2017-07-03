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

/*
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

// draw dragged out wall
if(arg_abs_diff_i > arg_abs_diff_j)
{
	// horizontal wall
	var i_left = arg_origin_i + min(0, arg_diff_i);
	var i_right = arg_origin_i + max(arg_diff_i, 0);
	scr_update_ghost_tile_with_overrides(i_left, arg_origin_j, action_offset, action_count, arg_rotation, spr_wall_end, -1, 180);
	scr_update_ghost_tile_with_overrides(i_right, arg_origin_j, action_offset, action_count, arg_rotation, spr_wall_end, -1, 0);
	for(var n = i_left + 1; n < i_right; n++)
	{
		scr_update_ghost_tile_with_overrides(n, arg_origin_j, action_offset, action_count, arg_rotation, spr_wall_straight, -1, 0);
	}
}
else
{
	var j_top = arg_origin_j + min(0, arg_diff_j);
	var j_bottom = arg_origin_j + max(arg_diff_j, 0);
	scr_update_ghost_tile_with_overrides(arg_origin_i, j_top, action_offset, action_count, arg_rotation, spr_wall_end, -1, 90);
	scr_update_ghost_tile_with_overrides(arg_origin_i, j_bottom, action_offset, action_count, arg_rotation, spr_wall_end, -1, 270);
	for(var n = j_top + 1; n < j_bottom; n++)
	{
		scr_update_ghost_tile_with_overrides(arg_origin_i, n, action_offset, action_count, arg_rotation, spr_wall_straight, -1, 90);
	}
}
*/