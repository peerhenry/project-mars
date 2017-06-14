/// @param i
/// @param j
/// @param action_offset
/// @param action_count
/// @param rotation
/// @param sprite_override
/// @param image_override
/// @param angle_override
var target_i = argument0;
var target_j = argument1;
var action_offset = argument2;
var action_count = argument3;
var arg_rotation = argument4;
var arg_sprite_override = argument5;
var arg_image_override = argument6;
var arg_angle_override = argument7;

var sprite = arg_sprite_override;

var map_value = scr_map_buffer_get_cell(target_i, target_j);
var map_i = (map_value & 1);
var map_o = (map_value >> 1) & 127; // next 7 bytes store o
	
var new_build_cell = noone;
var tile_is_valid = false;

var build_action_buffer = global.build_action_buffer;
var props_per_action = global.props_per_action;
for(var m = 0; m < action_count; m++) // loop over build actions
{
	// read from buffer
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
	
	if(sprite <= 0 && object_to_add > 0)
	{
		sprite = object_get_sprite(object_to_add);
	}
	
	if(validation_passed)
	{
		tile_is_valid = true;
		if(map_buffer_action != map_buffer_action.nothing) // first non-nothing action is chosen.
		{
			var angle = 0;
			if(arg_angle_override >= 0) angle = arg_angle_override;
			else angle = 90*arg_rotation;
			var bc_image = b_image_index;
			
			// exceptions
			switch(object_to_add)
			{
				case obj_suit_closet:
					var bc_image = (b_image_index + arg_rotation) % 8;
					angle = 0;
					break;
				case obj_drill:	// these objects should not listen to rotation
				case obj_cable:
				case obj_pipe:
				case obj_bed:
				case obj_oxygen_tank:
				case obj_pump:
					angle = 0;
					break;
			}
			
			if(arg_image_override >= 0)
			{
				bc_image = arg_image_override;
			}
			
			var new_build_cell = scr_create_build_cell(
				target_i, target_j,
				map_buffer_action,
				b_layer,
				object_to_add,
				object_to_remove,
				metal_cost,
				arg_sprite_override,
				bc_image,
				angle
			);
			break;
		}
	}
}

if(tile_is_valid && new_build_cell != noone)
{
	ds_stack_push(global.build_stack, new_build_cell);
	global.total_cost += new_build_cell[build_cell_cost];
}
else if(!tile_is_valid)
{
	ds_stack_push(global.invalid_build_stack, target_i, target_j, sprite);
	global.construction_is_valid = false;
}

return tile_is_valid;