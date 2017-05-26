var target_i = argument0;
var target_j = argument1;
var action_offset = argument2;
var action_count = argument3;
var arg_rotation = argument4;
var arg_validation_alpha = argument5;
var arg_sprite_override = argument6;
var arg_angle_override = argument7;

var map_value = scr_map_buffer_get_cell(target_i, target_j);
var map_i = (map_value & 1);
var map_o = (map_value >> 1) & 127; // next 7 bytes store o
	
var tile_is_valid = false;
var sprite_for_ghost = noone;
var there_is_a_drawable = false;
var there_is_a_valid_nondrawable = false;
	
var build_action_buffer = global.build_action_buffer;
var props_per_action = global.props_per_action;
for(var m = 0; m < action_count; m++) // loop over build actions
{
	// read from buffer
	var action_is_valid = false;
	buffer_seek(build_action_buffer, buffer_seek_start, action_offset + m*props_per_action*4);
	var validation_i = buffer_read(build_action_buffer, buffer_u32);
	var validation_o = buffer_read(build_action_buffer, buffer_u32);
	var b_image_index = buffer_read(build_action_buffer, buffer_s32);
	var map_buffer_action = buffer_read(build_action_buffer, buffer_u32);
	var b_layer = buffer_read(build_action_buffer, buffer_s32);
	var object_to_add = buffer_read(build_action_buffer, buffer_s32);
	var object_to_remove = buffer_read(build_action_buffer, buffer_s32);
	var metal_cost = buffer_read(build_action_buffer, buffer_s32);
	
	// validate
	var i_is_valid = scr_validate_i(validation_i, map_i);
	var o_is_valid = scr_validate_o(validation_o, map_o, target_i, target_j);
	var validation_passed = i_is_valid && o_is_valid;
	
	if(validation_passed)
	{
		action_is_valid = true;
		if(!tile_is_valid)
		{
			// first valid action is the chosen one.
			if(map_buffer_action != map_buffer_action.nothing)
			{
				var angle = 0;
				if(arg_angle_override >= 0) angle = arg_angle_override;
				else angle = 90*arg_rotation;
				var new_build_cell = scr_create_build_cell(
					target_i, target_j,
					map_buffer_action,
					b_layer,
					object_to_add,
					object_to_remove,
					metal_cost,
					arg_sprite_override,
					b_image_index,
					angle
				);
				ds_stack_push(global.build_stack, new_build_cell);
			}
			tile_is_valid = true;
		}
	}
	
	// determine if tile should be drawn	
	if(map_buffer_action != map_buffer_action.nothing && map_buffer_action != map_buffer_action.reserve)	// these actions will not be drawn
	{
		there_is_a_drawable = true;
		if(object_to_add != noone)
		{
			if(arg_sprite_override > 0) sprite_for_ghost = arg_sprite_override;
			else sprite_for_ghost = object_get_sprite(object_to_add);
		}
	}
	else if(action_is_valid)
	{
		there_is_a_valid_nondrawable = true;
	}
	else
	{
		there_is_a_drawable = true;
	}
}

if(!tile_is_valid) global.construction_is_valid = false;
	
if(!there_is_a_valid_nondrawable && there_is_a_drawable)
{
	var target_x = scr_gi_to_rc(target_i);
	var target_y = scr_gi_to_rc(target_j);
	if(sprite_for_ghost >= 0)
	{
		if(sprite_for_ghost == spr_suit_closet)
		{
			// use sprite index for orientation
			var ii = (b_image_index + arg_rotation) % 8;
			draw_sprite_ext( sprite_for_ghost, ii, target_x, target_y, 1, 1, 0, c_white, arg_validation_alpha );
		}
		else
		{
			var angle = 0;
			if(arg_angle_override >= 0) angle = arg_angle_override;
			else angle = 90*arg_rotation;
			draw_sprite_ext( sprite_for_ghost, b_image_index, target_x, target_y, 1, 1, angle, c_white, arg_validation_alpha );
		}
	}
	if(tile_is_valid) draw_set_color(c_lime);
	else draw_set_color(c_red);
	draw_rectangle(target_x-16, target_y-16, target_x+15, target_y+15, false);
}

return tile_is_valid;