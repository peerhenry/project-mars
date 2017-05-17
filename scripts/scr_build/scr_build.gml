var arg_x = argument0;
var arg_y = argument1;
var arg_build = argument2;
var arg_rotation = argument3;
var construction_is_valid = global.construction_is_valid;
if(!construction_is_valid) return;

if(global.debug_gameplay_messages){
show_debug_message("");
show_debug_message("=== constructing: " + string(arg_build));
show_debug_message("");
}

var arg_i = scr_rc_to_gi(arg_x);
var arg_j = scr_rc_to_gi(arg_y);

var clamped_x = scr_rc_clamp_center(arg_x);
var clamped_y = scr_rc_clamp_center(arg_y);

var tile_count = ds_map_find_value(global.build_tile_counts, arg_build);
var tile_offset = ds_map_find_value(global.build_tile_offsets, arg_build);
var new_instance = noone;
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
	var map_r = (map_value >> 8) & 255; // another byte for resource
	
	var tile_is_valid = false;
	var sprite_for_ghost = noone;
	var there_is_a_drawable = false;
	var there_is_a_valid_nondrawable = false;
	
	var action_to_execute = 0;
	var skip_it = action_count > 1;
	
	if(action_count > 1)	// determine which action must be performed
	{
		for(var m = 0; m < action_count; m++) // loop over build actions
		{
			// read from buffer
			var action_is_valid = false;
			buffer_seek(global.build_action_buffer, buffer_seek_start, action_offset + m*global.props_per_action*4);
			var validation_i = buffer_read(global.build_action_buffer, buffer_u32);
			var validation_o = buffer_read(global.build_action_buffer, buffer_u32);
			var b_image_index = buffer_read(global.build_action_buffer, buffer_u32);
			var map_buffer_action = buffer_read(global.build_action_buffer, buffer_u32);
			var b_layer = buffer_read(global.build_action_buffer, buffer_s32);
			var object_to_add = buffer_read(global.build_action_buffer, buffer_s32);
			var object_to_remove = buffer_read(global.build_action_buffer, buffer_s32);
		
			// the first valid non-nothing action is the one
			var valid_i = scr_validate_i(validation_i, map_i);
			var valid_o = scr_validate_o(validation_o, map_o, target_i, target_j);
			if(valid_i && valid_o && map_buffer_action != map_buffer_action.nothing)
			{
				skip_it = false;
				action_to_execute = m;
				break;
			}
		}
	}
	
	if(skip_it) continue;
	
	// perform chosen action for tile
	buffer_seek(global.build_action_buffer, buffer_seek_start, action_offset + action_to_execute*global.props_per_action*4);
	var validation_i = buffer_read(global.build_action_buffer, buffer_u32);
	var validation_o = buffer_read(global.build_action_buffer, buffer_u32);
	var b_image_index = buffer_read(global.build_action_buffer, buffer_u32);
	var map_buffer_action = buffer_read(global.build_action_buffer, buffer_u32);
	var b_layer = buffer_read(global.build_action_buffer, buffer_s32);
	var object_to_add = buffer_read(global.build_action_buffer, buffer_s32);
	var object_to_remove = buffer_read(global.build_action_buffer, buffer_s32);
	var metal_cost = buffer_read(global.build_action_buffer, buffer_s32);
	
	var added_object = scr_build_action_perform(map_buffer_action, map_r, map_i, target_i, target_j, object_to_remove, object_to_add, b_layer, metal_cost);
	if(rot_i == 0 && rot_j == 0) // assuming the center tile is the relevant instance for wall logic and room logic.
	{
		new_instance = added_object;
	}
}

if(new_instance != noone){
	scr_post_creation_logic(arg_build, new_instance);
	scr_room_logic(arg_build, new_instance);
	scr_wall_logic(arg_x, arg_y, arg_build);
}