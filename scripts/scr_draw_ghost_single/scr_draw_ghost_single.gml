var arg_i = argument0;
var arg_j = argument1;
var arg_build = argument2;
var arg_rotation = argument3;

var tile_count = ds_map_find_value(global.build_tile_counts, arg_build);
var tile_offset = ds_map_find_value(global.build_tile_offsets, arg_build);

global.construction_is_valid = true;

var validation_alpha = 0.42;
draw_set_alpha(validation_alpha);
var build_tile_buffer = global.build_tile_buffer;
var valid_tile_count = 0;
for(var n = 0; n < tile_count; n++)// loop over build tiles
{
	buffer_seek(build_tile_buffer, buffer_seek_start, tile_offset + n*global.props_per_build_tile*4);
	var di = buffer_read(build_tile_buffer, buffer_s32);
	var dj = buffer_read(build_tile_buffer, buffer_s32);
	var action_offset = buffer_read(build_tile_buffer, buffer_u32);
	var action_count = buffer_read(build_tile_buffer, buffer_u32);
	
	var rot_i = di;
	var rot_j = dj;
	if(arg_rotation == 1)
	{
		rot_i = dj;
		rot_j = -di;
	}
	else if(arg_rotation == 2)
	{
		rot_i = -di;
		rot_j = -dj;
	}
	else if(arg_rotation == 3)
	{
		rot_i = -dj;
		rot_j = di;
	}
	
	var target_i = arg_i + rot_i;
	var target_j = arg_j + rot_j;
	
	if(arg_build == build.basetile && (di != 0 || dj != 0))
	{
		var sprite = spr_wall_straight;
		var angle = 0;
		var nr = (dj)*3 + di + 4;
		switch(nr)
		{
			case 0:		// di = -1, dj = -1
				sprite = spr_wall_edge;
				angle = 90;
				break;
			case 2:		// di = 1, dj = -1
				sprite = spr_wall_edge;
				break;
			case 3:		// di = -1, dj = 0
			case 5:		// di = 1, dj = 0
				angle = 90;
				break;
			case 6:		// di = -1, dj = 1
				sprite = spr_wall_edge;
				angle = 180;
				break;
			case 8:		// di = 1, dj = 1
				sprite = spr_wall_edge;
				angle = 270;
				break;
		}
		scr_draw_tile_ghost(target_i, target_j, action_offset, action_count, arg_rotation, validation_alpha, sprite, angle);
	}
	else
	{
		var tile_is_valid = scr_draw_tile_ghost(target_i, target_j, action_offset, action_count, arg_rotation, validation_alpha, noone, -1);
		if(tile_is_valid) valid_tile_count++;
	}
}

draw_set_alpha(1);

// auto rotate door or hatch
if(arg_build == build.hatch)
{
	if(valid_tile_count == 3)
	{
		scr_increment_build_rotation(2);
	}
	else if(valid_tile_count == 1)
	{
		scr_increment_build_rotation(1);
	}
}
else if(arg_build == build.door && valid_tile_count == 1)
{
	scr_increment_build_rotation(1);
}