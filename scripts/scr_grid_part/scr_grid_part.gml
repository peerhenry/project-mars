/// @param removed_instance
/// @param grid
var arg_instance = argument0;
var arg_grid = argument1;

var grid_type = arg_grid.grid_type;

// show_debug_message("starting grid_part..."); // DEBUG

// Create the remainder of all components from the grid
var remainder_map = ds_map_create();
var remainder_key_list = ds_list_create();
// Copy grid components to the remainder
with(arg_grid)
{
	// show_debug_message("copying component map and key list..."); // DEBUG
	ds_map_copy(remainder_map, component_map);
	ds_list_copy(remainder_key_list, component_key_list);
	/*
	show_debug_message("key count: " + string(ds_list_size(component_key_list))); // DEBUG
	show_debug_message("map count: " + string(ds_map_size(component_map))); // DEBUG
	show_debug_message("grid_type: " + string(grid_type)); // DEBUG
	show_debug_message("instance: " + string(arg_instance)); // DEBUG
	show_debug_message("object index: " + string(arg_instance.object_index)); // DEBUG
	show_debug_message("i,j : " + string(arg_instance.occ_i) + ", " + string(arg_instance.occ_j)); // DEBUG
	*/
	if(ds_list_size(component_key_list) != ds_map_size(component_map))
	{
		show_error("ERROR: component_key_list had different size than component map", true);
	}
}

// Create the queue for the flood fill
show_debug_message("creating flood fill queue, visited list and map..."); // DEBUG
var flood_queue = ds_queue_create();
var visited_list = ds_list_create();
var visited_map = ds_map_create();

// Get the first component
with(arg_grid)
{
	var first_key = ds_list_find_value(component_key_list, 0);
	var first = ds_map_find_value(component_map, first_key); // can be an list
	
	ds_queue_enqueue(flood_queue, first);
	ds_map_add(visited_map, first_key, first);
	ds_list_add(visited_list, first_key);

	while(!ds_queue_empty(flood_queue))
	{
		//show_debug_message("Popping next item on queue"); // DEBUG
		var head = ds_queue_dequeue(flood_queue);
		var head_component = noone;
		if(ds_exists(head, ds_type_list)) head_component = ds_list_find_value(head, 0)
		else head_component = head;
		
		var head_key = head_component.encoded_ij;
		
		// Delete from remainder
		var head_key_pos = ds_list_find_index(remainder_key_list, head_key);
		ds_list_delete(remainder_key_list, head_key_pos)
		ds_map_delete(remainder_map, head_key);
		
		var head_i = scr_decode_grid_coord_i(head_key);
		var head_j = scr_decode_grid_coord_j(head_key);
		
		var adj_keys;
		adj_keys[3] = scr_encode_grid_coord(head_i,			head_j + 1	); // S
		adj_keys[2] = scr_encode_grid_coord(head_i - 1,		head_j		); // W
		adj_keys[1] = scr_encode_grid_coord(head_i,			head_j - 1	); // N
		adj_keys[0] = scr_encode_grid_coord(head_i + 1,		head_j 		); // E
		
		// Check if any adjacent coordinates are outside map boundaries
		if(head_i + 1 > global.horizontal_cells) adj_keys[0] = noone; 
		if(head_j - 1 < 0) adj_keys[1] = noone;
		if(head_i - 1 < 0) adj_keys[2] = noone;	
		if(head_j + 1 > global.vertical_cells) adj_keys[3] = noone;
		
		for(var n = 0; n < 4; n++)
		{
			var next_key = adj_keys[n];
			// show_debug_message("checking to push next key on queue: " + string(next_key)); // DEBUG
			var valid = 
				next_key >= 0
				&& ds_map_exists(component_map, next_key)
				&& !ds_map_exists(visited_map, next_key);
			
			// show_debug_message("Did it pass validation: " + string(valid)); // DEBUG
			if(valid)
			{
				var grid_cell = ds_map_find_value(component_map, next_key);
				ds_queue_enqueue(flood_queue, grid_cell);
				// Needs to be marked as visited
				ds_map_add(visited_map, next_key, grid_cell);
				ds_list_add(visited_list, next_key);
			}
		}
	}
}

// Check if count of visited components equals grid
var visited_size = ds_list_size(visited_list);
var original_size = ds_list_size(arg_grid.component_key_list);

show_debug_message("visited size was: " + string(visited_size)); // DEBUG
show_debug_message("argument grid size was: " + string(original_size)); // DEBUG

if(visited_size  != original_size)
{
	show_debug_message("The flood fill grid was different from argument grid!"); // DEBUG
	
	// Create new grid of visited components!
	show_debug_message("Creating new grid from visited components!"); // DEBUG
	var new_grid = scr_grid_new_from_components(visited_map, visited_list, grid_type);
	show_debug_message("Updating grid..."); // DEBUG
	scr_grid_update(new_grid);
	show_debug_message("Notifying grid components..."); // DEBUG
	scr_grid_notify_components(new_grid);
	
	// Make new grid from remainder and part
	// show_debug_message("Creating new grid from remainder components and parting again!"); // DEBUG
	var new_grid_from_remainder = scr_grid_new_from_components(remainder_map, remainder_key_list, grid_type);
	scr_grid_part(arg_instance, new_grid_from_remainder);
	
	// destroy original grid
	instance_destroy(arg_grid);
}
else // grid was not parted; it's still connected
{
	// Simply update and notify components
	scr_grid_update(arg_grid);
	scr_grid_notify_components(arg_grid);
	
	// destroy visited and remainders
	show_debug_message("destroying visited and remainder maps and lists..."); // DEBUG
	ds_map_destroy(visited_map);
	ds_map_destroy(remainder_map);
	ds_list_destroy(visited_list);
	ds_list_destroy(remainder_key_list);
}

// show_debug_message("destroying flood queue..."); // DEBUG
ds_queue_destroy(flood_queue);