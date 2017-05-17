var target_i = argument0;
var target_j = argument1;
var action_offset = argument2;
var action_count = argument3;
var arg_rotation = argument4;
var validation_alpha = argument5;

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
	var metal_cost = buffer_read(global.build_action_buffer, buffer_s32);
	
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
	var target_x = scr_gi_to_rc(target_i);
	var target_y = scr_gi_to_rc(target_j);
	if(sprite_for_ghost >= 0){
		draw_sprite_ext( sprite_for_ghost, b_image_index, target_x, target_y, 1, 1, 90*arg_rotation, c_white, validation_alpha );
		//draw_sprite(sprite_for_ghost, b_image_index, target_x, target_y);
	}
	if(tile_is_valid) draw_set_color(c_lime);
	else draw_set_color(c_red);
	draw_rectangle(target_x-16, target_y-16, target_x+15, target_y+15, false);
}