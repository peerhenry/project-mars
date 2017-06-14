/// @param construction
/// @param di
/// @param dj
/// @param validation_i
/// @param validation_0
/// @param image_index
/// @param map_buffer_action
/// @param layer
/// @param object_to_add
/// @param object_to_remove
/// @param metal_cost

/// Add build action to big bad buffer, and update maps for acion counts and tile counts
var arg_construction = argument0;		// what construction is this tile for
var arg_d_i = argument1;				//
var arg_d_j = argument2;				//
var arg_validation_i = argument3;		// inside/outside validation
var arg_validation_o = argument4;		// occupation validation
var arg_image_index = argument5;		// what image index to use for ghost
var arg_map_buffer_action = argument6;
var arg_layer = argument7;
var arg_object_to_add = argument8;
var arg_object_to_remove = argument9;
var arg_metal_cost = argument10;

if(ds_map_exists(global.build_tile_counts, arg_construction)) // construction exists
{
	if(arg_d_i == global.last_d_i && arg_d_j == global.last_d_j) // action is for the same build tile
	{
		// increment action count for build tile
		var current_action_count = ds_map_find_value(global.build_action_counts, global.last_build_tile_key);
		var action_count_incremented = current_action_count + 1;
		ds_map_replace(global.build_action_counts, global.last_build_tile_key, action_count_incremented);
	}
	else // new build tile
	{
		// add new build tile to action counts
		global.last_d_i = arg_d_i;
		global.last_d_j = arg_d_j;
		global.last_build_tile_key++;
		ds_map_add(global.build_action_counts, global.last_build_tile_key, 1);
		
		// increment build tile count for construction
		var current_count = ds_map_find_value(global.build_tile_counts, arg_construction);
		ds_map_replace(global.build_tile_counts, arg_construction, current_count + 1);
	}
}
else // new construction
{
	// add new construction to build tile counts
	ds_list_add(global.construction_list, arg_construction);
	ds_map_add(global.build_tile_counts, arg_construction, 1);
	// also add new build tile to action counts
	global.last_d_i = arg_d_i;
	global.last_d_j = arg_d_j;
	global.last_build_tile_key++;
	ds_map_add(global.build_action_counts, global.last_build_tile_key, 1);
}

var big_bad_buffer = global.big_bad_buffer;
buffer_write(big_bad_buffer, buffer_u32, arg_construction);
buffer_write(big_bad_buffer, buffer_s32, arg_d_i);
buffer_write(big_bad_buffer, buffer_s32, arg_d_j);
buffer_write(big_bad_buffer, buffer_u32, arg_validation_i);
buffer_write(big_bad_buffer, buffer_u32, arg_validation_o);
buffer_write(big_bad_buffer, buffer_s32, arg_image_index);
buffer_write(big_bad_buffer, buffer_u32, arg_map_buffer_action);
buffer_write(big_bad_buffer, buffer_s32, arg_layer);
buffer_write(big_bad_buffer, buffer_s32, arg_object_to_add);
buffer_write(big_bad_buffer, buffer_s32, arg_object_to_remove);
buffer_write(big_bad_buffer, buffer_s32, arg_metal_cost);
