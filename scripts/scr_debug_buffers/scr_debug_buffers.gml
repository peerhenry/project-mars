if(!global.debug_gameplay_messages) return;

show_debug_message("");
show_debug_message("DEBUG BUFFERS");
show_debug_message("");


var build_tile_count = 0;
var build_action_count = 0;
var build_tile_id = 1;

show_debug_message("");
show_debug_message("build_actions_counts map: ");
show_debug_message("");

for(var s = 0; s< ds_list_size(global.construction_list); s++)
{
	var next_construction = ds_list_find_value(global.construction_list, s);
	show_debug_message("### construction: " + string(next_construction));
	var nr_of_tiles = ds_map_find_value(global.build_tile_counts, next_construction );
	build_tile_count += nr_of_tiles;
	for(var bt = 1; bt < (nr_of_tiles+1); bt++ )	// loops over build tiles
	{
		var nr_of_actions = ds_map_find_value(global.build_action_counts, build_tile_id);
		build_action_count += nr_of_actions;
		show_debug_message("bt index: " + string(build_tile_id));
		show_debug_message("actions: " + string(nr_of_actions));
		build_tile_id++;
	}
}

show_debug_message("");
show_debug_message("build_tile_buffer: ");
show_debug_message("");
buffer_seek(global.build_tile_buffer, buffer_seek_start, 0);

for(var n = 0; n < build_tile_count; n++)
{
	var di = buffer_read(global.build_tile_buffer, buffer_s32);
	var dj = buffer_read(global.build_tile_buffer, buffer_s32);
	var offset = buffer_read(global.build_tile_buffer, buffer_u32);
	var action_count = buffer_read(global.build_tile_buffer, buffer_u32);
	show_debug_message("di: " + string(di));
	show_debug_message("dj: " + string(dj));
	show_debug_message("offset: " + string(offset));
	show_debug_message("action_count: " + string(action_count ));
	show_debug_message("");
}


show_debug_message("");
show_debug_message("build_action_buffer: ");
show_debug_message("");
buffer_seek(global.build_action_buffer, buffer_seek_start, 0);

for(var n = 0; n < build_action_count; n++)
{
	var validation_i = buffer_read(global.build_action_buffer, buffer_u32);
	var validation_o = buffer_read(global.build_action_buffer, buffer_u32);
	var b_image_index = buffer_read(global.build_action_buffer, buffer_u32);
	var map_buffer_action = buffer_read(global.build_action_buffer, buffer_u32);
	var b_layer = buffer_read(global.build_action_buffer, buffer_s32);
	var object_to_add = buffer_read(global.build_action_buffer, buffer_s32);
	var object_to_remove = buffer_read(global.build_action_buffer, buffer_s32);
	show_debug_message("validation_i: " + string(validation_i));
	show_debug_message("validation_o: " + string(validation_o));
	show_debug_message("b_image_index: " + string(b_image_index));
	show_debug_message("map_buffer_action: " + string(map_buffer_action));
	show_debug_message("b_layer: " + string(b_layer));
	show_debug_message("object_to_add: " + string(object_to_add));
	show_debug_message("object_to_remove: " + string(object_to_remove));
	show_debug_message("");
}