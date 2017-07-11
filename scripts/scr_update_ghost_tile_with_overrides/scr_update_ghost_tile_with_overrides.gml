/// @param i
/// @param j
/// @param arg_actions
/// @param sprite_override
/// @param image_override
/// @param angle_override
var target_i = argument0;
var target_j = argument1;
var arg_actions = argument2;
var arg_sprite_override = argument3;
var arg_image_override = argument4;
var arg_angle_override = argument5;

var map_value = scr_map_buffer_get_cell(target_i, target_j);
var map_i = (map_value & 1);
var map_o = (map_value >> 1) & 127; // next 7 bytes store o

var new_build_cell = noone;
var tile_is_valid = false;

var sprite = arg_sprite_override;

for(var m = 0; m < array_length_1d(arg_actions); m++) // loop over build actions
{
	var next_action = arg_actions[m];
	
	var validation_i = next_action[macro_validation_i];
	var validation_o = next_action[macro_validation_o];
	var b_image_index = 0;
	var map_buffer_action = next_action[macro_map_buffer_action];
	var b_layer = next_action[macro_layer];
	var object_to_add = next_action[macro_object_to_add];
	var object_to_remove = next_action[macro_object_to_remove];
	var metal_cost = next_action[macro_metal_cost];
	
	// validate
	var i_is_valid = scr_validate_i(validation_i, map_i);
	var o_is_valid = scr_validate_o(validation_o, map_o, target_i, target_j);
	var validation_passed = i_is_valid && o_is_valid;
	
	if(validation_passed)
	{
		tile_is_valid = true;
		if(map_buffer_action != map_buffer_action.nothing) // first non-nothing action is chosen.
		{
			var angle = 0;
			if(arg_angle_override >= 0) angle = arg_angle_override;
			
			var bc_image = b_image_index;
			if(arg_image_override >= 0)
			{
				bc_image = arg_image_override;
			}
			
			if(sprite <= 0 && object_to_add > 0)
			{
				sprite = object_get_sprite(object_to_add);
			}
			
			var required_object = noone;
			if(validation_i == build_validation_i.inside) required_object = obj_base_tile;
			if(validation_o == build_validation_o.wall) required_object = obj_wall;
			
			var new_build_cell = scr_create_build_cell(
				target_i, target_j,
				map_buffer_action,
				b_layer,
				object_to_add,
				object_to_remove,
				metal_cost,
				sprite,
				bc_image,
				angle,
				required_object
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