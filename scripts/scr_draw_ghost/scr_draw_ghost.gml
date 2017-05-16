var arg_x = argument0;
var arg_y = argument1;
var arg_build = argument2;
var arg_rotation = argument3;

var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

var clamped_x = scr_rc_clamp_center(arg_x);
var clamped_y = scr_rc_clamp_center(arg_y);

var tile_count = ds_map_find_value(global.build_tile_counts, arg_build);
var tile_offset = ds_map_find_value(global.build_tile_offsets, arg_build);

global.construction_is_valid = true;

var validation_alpha = 0.42;
draw_set_alpha(validation_alpha);
for(var n = 0; n < tile_count; n++)// loop over build tiles
{
	buffer_seek(global.build_tile_buffer, buffer_seek_start, tile_offset + n*global.props_per_build_tile*4);
	var di = buffer_read(global.build_tile_buffer, buffer_s32);
	var dj = buffer_read(global.build_tile_buffer, buffer_s32);
	var action_offset = buffer_read(global.build_tile_buffer, buffer_u32);
	var action_count = buffer_read(global.build_tile_buffer, buffer_u32);
	
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
	var map_value = scr_map_buffer_get_cell(target_i, target_j);
	var map_i = (map_value & 1);
	var map_o = (map_value >> 1) & 127; // next 7 bytes store o
	
	var tile_is_valid = false;
	var sprite_for_ghost = noone;
	var there_is_a_drawable = false;
	var there_is_a_valid_nondrawable = false;
	
	for(var m = 0; m < action_count; m++) // loop over build actions
	{
		// read from buffer
		var action_is_valid = false;
		buffer_seek(global.build_action_buffer, buffer_seek_start, action_offset + m*global.props_per_action*4);
		var validation_i = buffer_read(global.build_action_buffer, buffer_u32);
		var validation_o = buffer_read(global.build_action_buffer, buffer_u32);
		var b_image_index = buffer_read(global.build_action_buffer, buffer_s32);
		var map_buffer_action = buffer_read(global.build_action_buffer, buffer_u32);
		var b_layer = buffer_read(global.build_action_buffer, buffer_s32);
		var object_to_add = buffer_read(global.build_action_buffer, buffer_s32);
		var object_to_remove = buffer_read(global.build_action_buffer, buffer_s32);
		
		// do shit with buffer data
		if(scr_validate_i(validation_i, map_i) && scr_validate_o(validation_o, map_o, target_i, target_j))
		{
			action_is_valid = true;
			tile_is_valid = true;
		}
		
		if(map_buffer_action != map_buffer_action.nothing && map_buffer_action != map_buffer_action.reserve)
		{
			there_is_a_drawable = true;
			if(object_to_add != noone){
				sprite_for_ghost = object_get_sprite(object_to_add);
			}
		}
		else if(action_is_valid)
		{
			there_is_a_valid_nondrawable = true;
		}
		else
		{
			// we should draw this invalid tile.
			there_is_a_drawable = true;
		}
	}
	
	if(!tile_is_valid) global.construction_is_valid = false;
	
	if(!there_is_a_valid_nondrawable && there_is_a_drawable)
	{
		var target_x = clamped_x + 32*rot_i;
		var target_y = clamped_y + 32*rot_j;
		if(sprite_for_ghost >= 0){
			draw_sprite_ext( sprite_for_ghost, b_image_index, target_x, target_y, 1, 1, 90*arg_rotation, c_white, validation_alpha );
			//draw_sprite(sprite_for_ghost, b_image_index, target_x, target_y);
		}
		if(tile_is_valid) draw_set_color(c_lime);
		else draw_set_color(c_red);
		draw_rectangle(target_x-16, target_y-16, target_x+15, target_y+15, false);
	}
}

draw_set_alpha(1);