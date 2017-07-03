/*

var debug_start_messages = global.debug_start_messages;
if(debug_start_messages){
	show_debug_message("");
	show_debug_message("FINALIZE BUFFERS");
	show_debug_message("");
}

// 1. determine total amount of build tiles and build actions


var build_tile_count = 0;
var build_action_count = 0;
var build_tile_id = 1;
var construction_list = global.construction_list;

for(var s = 0; s< ds_list_size(construction_list); s++)
{
	var next_construction = ds_list_find_value(construction_list, s);
	var nr_of_tiles = ds_map_find_value(global.build_tile_counts, next_construction );
	
	if(debug_start_messages)
	{
		show_debug_message("next key from build_tile_counts: " + string(next_construction )); // DEBUG
		show_debug_message("number of tiles for this: " + string(nr_of_tiles)); // DEBUG
	}
	
	build_tile_count += nr_of_tiles;
	for(var n = 0; n < nr_of_tiles; n++ )	// loops over build tiles
	{
		var nr_of_actions = ds_map_find_value(global.build_action_counts, build_tile_id);
		build_action_count += nr_of_actions;
		build_tile_id++;
	}
}

if(debug_start_messages){
show_debug_message(""); // DEBUG
show_debug_message("Total amound of build tiles: " + string(build_tile_count)); // DEBUG
show_debug_message("Total amound of build actions: " + string(build_action_count)); // DEBUG
show_debug_message(""); // DEBUG
}

// 2. reset iteration things
buffer_seek(global.big_bad_buffer, buffer_seek_start, 0);
var build_tile_id = 1;

// 3. create buffers
global.props_per_build_tile = 4;
global.build_tile_buffer = buffer_create(4*global.props_per_build_tile*build_tile_count, buffer_fixed, 4);
var build_tile_buffer = global.build_tile_buffer;
global.props_per_action = 8;
global.build_action_buffer = buffer_create(4*global.props_per_action*build_action_count, buffer_fixed, 4);
global.build_tile_offsets = ds_map_create();
var big_bad_buffer = global.big_bad_buffer;

// 4. fill buffers
for(var s = 0; s< ds_list_size(construction_list); s++)
{
	var next_construction = ds_list_find_value(construction_list, s);
	var nr_of_tiles = ds_map_find_value(global.build_tile_counts, next_construction);
	
	if(debug_start_messages)
	{
		show_debug_message("#next construction: " + string(next_construction)); // DEBUG
		show_debug_message("#number of tiles for this: " + string(nr_of_tiles)); // DEBUG
	}
	
	var tile_offset = buffer_tell(build_tile_buffer);
	ds_map_add(global.build_tile_offsets, next_construction, tile_offset);
	
	for(var n = 0; n < nr_of_tiles; n++ )	// loops over build tiles
	{
		var nr_of_actions = ds_map_find_value(global.build_action_counts, build_tile_id);
		for(var m = 0; m < nr_of_actions; m++) // loops over build actions
		{
			var construction = buffer_read(big_bad_buffer, buffer_u32);
			var d_i = buffer_read(big_bad_buffer, buffer_s32);
			var d_j = buffer_read(big_bad_buffer, buffer_s32);
			var validation_i = buffer_read(big_bad_buffer, buffer_u32);
			var validation_o = buffer_read(big_bad_buffer, buffer_u32);
			var b_image_index = buffer_read(big_bad_buffer, buffer_s32);
			var map_buffer_action = buffer_read(big_bad_buffer, buffer_u32);
			var b_layer = buffer_read(big_bad_buffer, buffer_s32);
			var object_to_add = buffer_read(big_bad_buffer, buffer_s32);
			var object_to_remove = buffer_read(big_bad_buffer, buffer_s32);
			var metal_cost = buffer_read(big_bad_buffer, buffer_s32);
			
			var build_action_buffer = global.build_action_buffer;
			if(m == 0){ // add a build tile for each first action
				var action_offset = buffer_tell(build_action_buffer);
				buffer_write(build_tile_buffer, buffer_s32, d_i);
				buffer_write(build_tile_buffer, buffer_s32, d_j);
				buffer_write(build_tile_buffer, buffer_u32, action_offset);
				buffer_write(build_tile_buffer, buffer_u32, nr_of_actions);
				if(debug_start_messages)
				{
					show_debug_message("just wrote to build_tile_buffer: "); // DEBUG
					show_debug_message(string(d_i) + ", " + string(d_j) + " , " + string(action_offset) + " , " + string(nr_of_actions) ); // DEBUG
				}
			}
			
			if(debug_start_messages) show_debug_message("action for : " + string(construction) + " delta: " + string(d_i) + ", " + string(d_j) ); // DEBUG
			
			buffer_write(build_action_buffer, buffer_u32, validation_i);
			buffer_write(build_action_buffer, buffer_u32, validation_o);
			buffer_write(build_action_buffer, buffer_s32, b_image_index);
			buffer_write(build_action_buffer, buffer_u32, map_buffer_action);
			buffer_write(build_action_buffer, buffer_s32, b_layer);
			buffer_write(build_action_buffer, buffer_s32, object_to_add);
			buffer_write(build_action_buffer, buffer_s32, object_to_remove);
			buffer_write(build_action_buffer, buffer_s32, metal_cost);
		}
		build_tile_id++;
	}
}


buffer_delete(global.big_bad_buffer);

*/