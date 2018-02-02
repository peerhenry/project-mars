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

var sprite = arg_sprite_override;
var new_ghost_cell = noone;
var tile_is_valid = false;
var ghost = global.construction_ghost;
var owner = ghost[? macro_ghost_owner];

// loop over build actions to create a ghost cell
// the first build action that passes validation is the one that is used in ghost
for(var m = 0; m < array_length_1d(arg_actions); m++)
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
	var validation_passed = scr_validate_cell(target_i, target_j, validation_i, validation_o, owner);
	
	if(validation_passed)
	{
		tile_is_valid = true;
		if(map_buffer_action != map_buffer_action.nothing) // first non-nothing action is chosen.
		{
			var angle = 0;
			if(arg_angle_override >= 0) angle = arg_angle_override;
			var bc_image = b_image_index;
			if(arg_image_override >= 0) bc_image = arg_image_override;
			if(sprite <= 0 && object_to_add > 0) sprite = object_get_sprite(object_to_add);
			var required_object = noone;
			if(validation_i == build_validation_i.inside) required_object = obj_base_tile;
			if(validation_o == build_validation_o.wall) required_object = obj_wall;
			
			new_ghost_cell = scr_create_ghost_cell(
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

var ghost_stack = ghost[?macro_ghost_stack];
var ghost_invalid_stack = ghost[?macro_ghost_invalid_stack];

if(tile_is_valid && new_ghost_cell != noone)
{
	ds_stack_push(ghost_stack, new_ghost_cell);
	var new_cost = ghost[?macro_ghost_cost] + new_ghost_cell[build_cell_cost];
	ds_map_replace(ghost, macro_ghost_cost, new_cost);
}
else if(!tile_is_valid)
{
	ds_stack_push(ghost_invalid_stack, target_i, target_j, sprite);
	ds_map_replace(ghost, macro_ghost_valid, false);
}

return tile_is_valid;