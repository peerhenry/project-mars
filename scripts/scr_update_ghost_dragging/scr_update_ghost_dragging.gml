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

if(arg_build == build.wall)
{
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
		scr_update_ghost_tile(i_left, arg_origin_j, action_offset, action_count, arg_rotation, spr_wall_end, 180);
		scr_update_ghost_tile(i_right, arg_origin_j, action_offset, action_count, arg_rotation, spr_wall_end, 0);
		for(var n = i_left + 1; n < i_right; n++)
		{
			scr_update_ghost_tile(n, arg_origin_j, action_offset, action_count, arg_rotation, spr_wall_straight, 0);
		}
	}
	else
	{
		var j_top = arg_origin_j + min(0, arg_diff_j);
		var j_bottom = arg_origin_j + max(arg_diff_j, 0);
		scr_update_ghost_tile(arg_origin_i, j_top, action_offset, action_count, arg_rotation, spr_wall_end, 90);
		scr_update_ghost_tile(arg_origin_i, j_bottom, action_offset, action_count, arg_rotation, spr_wall_end, 270);
		for(var n = j_top + 1; n < j_bottom; n++)
		{
			scr_update_ghost_tile(arg_origin_i, n, action_offset, action_count, arg_rotation, spr_wall_straight, 90);
		}
	}
}
else if(arg_build == build.basetile)
{
	var tile_count = ds_map_find_value(global.build_tile_counts, arg_build);
	var tile_offset = ds_map_find_value(global.build_tile_offsets, arg_build);
	
	var next_i = arg_origin_i;
	var next_j = arg_origin_j;
		
	var i_increment = 1;
	var i_count = arg_i - arg_origin_i;
	var i_left = arg_origin_i - 1;
	var i_right = arg_i + 1;
		
	if(arg_i < arg_origin_i)
	{
		i_increment = -1;
		i_count = arg_origin_i - arg_i;
		i_left = arg_i - 1;
		i_right = arg_origin_i + 1;
	}
	
	var j_increment = 1;
	var j_count = arg_j - arg_origin_j;
	var j_top = arg_j + 1;
	var j_bottom = arg_origin_j - 1;
		
	if(arg_j < arg_origin_j)
	{
		j_increment = -1;
		j_count = arg_origin_j - arg_j;
		j_top = arg_origin_j + 1 ;
		j_bottom = arg_j - 1;
	}
	
	var build_tile_buffer = global.build_tile_buffer;
	var props_per_build_tile = global.props_per_build_tile;
	for(var n = 0; n<tile_count; n++)
	{
		buffer_seek(build_tile_buffer, buffer_seek_start, tile_offset + n*props_per_build_tile*4);
		var di = buffer_read(build_tile_buffer, buffer_s32);
		var dj = buffer_read(build_tile_buffer, buffer_s32);
		var action_offset = buffer_read(build_tile_buffer, buffer_u32);
		var action_count = buffer_read(build_tile_buffer, buffer_u32);
		
		if(di == 0)
		{
			if(dj == 0)
			{
				// draw square of basetiles
				for(var ni = 0; ni <= i_count; ni++)
				{
					next_j = arg_origin_j;
					for(var nj = 0; nj <= j_count; nj++)
					{
						scr_update_ghost_tile(next_i, next_j, action_offset, action_count, arg_rotation, noone, -1);
						next_j = next_j + j_increment;
					}
					next_i = next_i + i_increment;
				}
			}
			else if(dj == 1)
			{
				// draw south wall
				next_i = arg_origin_i;
				for(var ni = 0; ni <= i_count; ni++)
				{
					scr_update_ghost_tile(next_i, j_bottom, action_offset, action_count, arg_rotation, spr_wall_straight, 0);
					next_i = next_i + i_increment;
				}
			}
			else
			{
				// draw north wall
				next_i = arg_origin_i;
				for(var ni = 0; ni <= i_count; ni++)
				{
					scr_update_ghost_tile(next_i, j_top, action_offset, action_count, arg_rotation, spr_wall_straight, 0);
					next_i = next_i + i_increment;
				}
			}
		}
		else if(di == 1)
		{
			if(dj == 0)
			{
				// draw east wall
				next_j = arg_origin_j;
				for(var nj = 0; nj <= j_count; nj++)
				{
					scr_update_ghost_tile(i_right, next_j, action_offset, action_count, arg_rotation, spr_wall_straight, 90);
					next_j = next_j + j_increment;
				}
			}
			else if(dj == 1)
			{
				// draw south-east edge
				scr_update_ghost_tile(i_right, j_bottom, action_offset, action_count, arg_rotation, spr_wall_edge, 0);
			}
			else
			{
				// draw north-east edge
				scr_update_ghost_tile(i_right, j_top, action_offset, action_count, arg_rotation, spr_wall_edge, 270);
			}
		}
		else
		{
			if(dj == 0)
			{
				// draw west wall
				next_j = arg_origin_j;
				for(var nj = 0; nj <= j_count; nj++)
				{
					scr_update_ghost_tile(i_left, next_j, action_offset, action_count, arg_rotation, spr_wall_straight, 90);
					next_j = next_j + j_increment;
				}
			}
			else if(dj == 1)
			{
				// draw south-west edge
				scr_update_ghost_tile(i_left, j_bottom, action_offset, action_count, arg_rotation, spr_wall_edge, 90);
			}
			else
			{
				// draw north-west edge
				scr_update_ghost_tile(i_left, j_top, action_offset, action_count, arg_rotation, spr_wall_edge, 180);
			}
		}
	}
}