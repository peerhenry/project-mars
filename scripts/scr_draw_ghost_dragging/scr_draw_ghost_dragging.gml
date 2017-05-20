var arg_origin_x = argument0;
var arg_origin_y = argument1;
var arg_x = argument2;
var arg_y = argument3;
var arg_build = argument4;
var arg_rotation = argument5;

var origin_i = scr_rc_to_gi(arg_origin_x);
var origin_j = scr_rc_to_gi(arg_origin_y);
var end_i = scr_rc_to_gi(arg_x);
var end_j = scr_rc_to_gi(arg_y);

var diff_i = end_i - origin_i;
var diff_j = end_j - origin_j;
var abs_diff_i = abs(diff_i);
var abs_diff_j = abs(diff_j);

var diff_is_significant = abs_diff_i  > 0 || abs_diff_j > 0;

if(!diff_is_significant || arg_build != build.wall || !arg_build == build.basetile)
{
	scr_draw_ghost(arg_x, arg_y, arg_build, arg_rotation);
}

var validation_alpha = 0.42;
draw_set_alpha(validation_alpha);
if(arg_build == build.wall)
{
	var tile_count = ds_map_find_value(global.build_tile_counts, arg_build);
	var tile_offset = ds_map_find_value(global.build_tile_offsets, arg_build);
	buffer_seek(global.build_tile_buffer, buffer_seek_start, tile_offset + 2*4); // skip the first two props (di, and dj); we know they're 0
	var action_offset = buffer_read(global.build_tile_buffer, buffer_u32);
	var action_count = buffer_read(global.build_tile_buffer, buffer_u32);

	// draw dragged out wall
	if(abs_diff_i > abs_diff_j)
	{
		// horizontal wall
		var i_left = origin_i + min(0, diff_i);
		var i_right = origin_i + max(diff_i, 0);
		scr_draw_tile_ghost_override(i_left, origin_j, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_end, 180);
		scr_draw_tile_ghost_override(i_right, origin_j, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_end, 0);
		for(var n = i_left + 1; n < i_right; n++)
		{
			scr_draw_tile_ghost_override(n, origin_j, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_straight, 0);
		}
	}
	else
	{
		var j_top = origin_j + min(0, diff_j);
		var j_bottom = origin_j + max(diff_j, 0);
		scr_draw_tile_ghost_override(origin_i, j_top, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_end, 90);
		scr_draw_tile_ghost_override(origin_i, j_bottom, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_end, 270);
		for(var n = j_top + 1; n < j_bottom; n++)
		{
			scr_draw_tile_ghost_override(origin_i, n, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_straight, 90);
		}
	}
}
else if(arg_build == build.basetile)
{
	var tile_count = ds_map_find_value(global.build_tile_counts, arg_build);
	var tile_offset = ds_map_find_value(global.build_tile_offsets, arg_build);
	
	var next_i = origin_i;
	var next_j = origin_j;
		
	var i_increment = 1;
	var i_count = end_i - origin_i;
	var i_left = origin_i - 1;
	var i_right = end_i + 1;
		
	if(end_i < origin_i)
	{
		i_increment = -1;
		i_count = origin_i - end_i;
		i_left = end_i - 1;
		i_right = origin_i + 1;
	}
	
	var j_increment = 1;
	var j_count = end_j - origin_j;
	var j_top = end_j + 1;
	var j_bottom = origin_j - 1;
		
	if(end_j < origin_j)
	{
		j_increment = -1;
		j_count = origin_j - end_j;
		j_top = origin_j + 1 ;
		j_bottom = end_j - 1;
	}
	
	for(var n = 0; n<tile_count; n++)
	{
		buffer_seek(global.build_tile_buffer, buffer_seek_start, tile_offset + n*global.props_per_build_tile*4);
		var di = buffer_read(global.build_tile_buffer, buffer_s32);
		var dj = buffer_read(global.build_tile_buffer, buffer_s32);
		var action_offset = buffer_read(global.build_tile_buffer, buffer_u32);
		var action_count = buffer_read(global.build_tile_buffer, buffer_u32);
		
		if(di == 0)
		{
			if(dj == 0)
			{
				// draw square of basetiles
				for(var ni = 0; ni <= i_count; ni++)
				{
					next_j = origin_j;
					for(var nj = 0; nj <= j_count; nj++)
					{
						scr_draw_tile_ghost(next_i, next_j, action_offset, action_count, arg_rotation, validation_alpha);
						next_j = next_j + j_increment;
					}
					next_i = next_i + i_increment;
				}
			}
			else if(dj == 1)
			{
				// draw south wall
				next_i = origin_i;
				for(var ni = 0; ni <= i_count; ni++)
				{
					scr_draw_tile_ghost_override(next_i, j_bottom, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_straight, 0);
					next_i = next_i + i_increment;
				}
			}
			else
			{
				// draw north wall
				next_i = origin_i;
				for(var ni = 0; ni <= i_count; ni++)
				{
					scr_draw_tile_ghost_override(next_i, j_top, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_straight, 0);
					next_i = next_i + i_increment;
				}
			}
		}
		else if(di == 1)
		{
			if(dj == 0)
			{
				// draw east wall
				next_j = origin_j;
				for(var nj = 0; nj <= j_count; nj++)
				{
					scr_draw_tile_ghost_override(i_right, next_j, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_straight, 90);
					next_j = next_j + j_increment;
				}
			}
			else if(dj == 1)
			{
				// draw south-east edge
				scr_draw_tile_ghost_override(i_right, j_bottom, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_edge, 0);
			}
			else
			{
				// draw north-east edge
				scr_draw_tile_ghost_override(i_right, j_top, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_edge, 270);
			}
		}
		else
		{
			if(dj == 0)
			{
				// draw west wall
				next_j = origin_j;
				for(var nj = 0; nj <= j_count; nj++)
				{
					scr_draw_tile_ghost_override(i_left, next_j, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_straight, 90);
					next_j = next_j + j_increment;
				}
			}
			else if(dj == 1)
			{
				// draw south-west edge
				scr_draw_tile_ghost_override(i_left, j_bottom, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_edge, 90);
			}
			else
			{
				// draw north-west edge
				scr_draw_tile_ghost_override(i_left, j_top, action_offset, action_count, arg_rotation, validation_alpha, spr_wall_edge, 180);
			}
		}
	}
}
else scr_draw_ghost(arg_x, arg_y, arg_build, arg_rotation);

draw_set_alpha(1);