/// @Description This script performs a flood fill on a grid, and parts it if it is disconnected
/// @param grid
scr_trace_script("scr_grid_part", [argument0]);
debug_instance_type(argument0, obj_grid);
var arg_grid = argument0;
var grid_type = arg_grid.grid_type;

if(grid_type == macro_grid_oxygen) show_debug_message("parting O2 grid: " + string(arg_grid));

// Create the data structures that will contain the remainder of all components from the grid
// When the flood fill reaches a component, it will be removed from remainder.
var remainder_map = ds_map_create();
var remainder_key_list = ds_list_create();
// Copy grid components to the remainder
with(arg_grid)
{
	ds_map_copy(remainder_map, tile_map);
	ds_list_copy(remainder_key_list, tile_key_list);
	if(ds_list_size(tile_key_list) != ds_map_size(tile_map))
	{
		show_error("ERROR: tile_key_list had different size than component map", true);
	}
}

// Create the queue for the flood fill
var flood_queue = ds_queue_create();
var visited_list = ds_list_create();
var visited_map = ds_map_create();

// Get the first component
with(arg_grid)
{
	var first_key = ds_list_find_value(tile_key_list, 0);
	var first = ds_map_find_value(tile_map, first_key); // should be a list

	ds_queue_enqueue(flood_queue, first);
	ds_map_add(visited_map, first_key, first);
	ds_list_add(visited_list, first_key);

	var failsafe_counter = 0;
	while(!ds_queue_empty(flood_queue))
	{
		if(failsafe_counter > 100000)
		{
			show_error("Never ending while loop in grid_part!", true);
		}
		
		//show_debug_message("Popping next item on queue"); // DEBUG
		var head = ds_queue_dequeue(flood_queue);
		var head_component = noone;
		if(ds_exists(head, ds_type_list)) head_component = ds_list_find_value(head, 0)
		else
		{
			//show_error("head from grid flood queue was not a list!", true); // DEBUG
			head_component = head;
		}
		
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
				&& ds_map_exists(tile_map, next_key)
				&& !ds_map_exists(visited_map, next_key);
			
			// show_debug_message("Did it pass validation: " + string(valid)); // DEBUG
			if(valid)
			{
				var grid_cell = ds_map_find_value(tile_map, next_key);
				ds_queue_enqueue(flood_queue, grid_cell);
				// Needs to be marked as visited
				ds_map_add(visited_map, next_key, grid_cell);
				ds_list_add(visited_list, next_key);
			}
		}
		
		failsafe_counter++;
	}
}

// Check if count of visited components equals grid
var visited_size = ds_list_size(visited_list);
var original_size = ds_list_size(arg_grid.tile_key_list);

if(visited_size != original_size)
{
	// Create new grid of visited components!
	var new_grid = scr_grid_new_from_tile_map(visited_map, visited_list, grid_type);
	scr_grid_update(new_grid);	// calculates grid properties (eg. storage, output, demand...)
	scr_grid_notify_components(new_grid); // triggers the notify event in components
	
	// Make new grid from remainder and part
	var new_grid_from_remainder = scr_grid_new_from_tile_map(remainder_map, remainder_key_list, grid_type);
	scr_grid_part(new_grid_from_remainder);
	
	// destroy original grid
	if(grid_type == macro_grid_oxygen) show_debug_message("destroying O2 grid: " + string(arg_grid));
	instance_destroy(arg_grid);
	
	// Check if new grid is valid
	debug_grid(new_grid);
}
else // grid was not parted; it's still connected
{
	// Simply update and notify components
	scr_grid_update(arg_grid);
	scr_grid_notify_components(arg_grid);
	
	// destroy visited and remainders
	ds_map_destroy(visited_map);
	ds_map_destroy(remainder_map);
	ds_list_destroy(visited_list);
	ds_list_destroy(remainder_key_list);
	
	// check if grid is still valid
	debug_grid(arg_grid);
}

ds_queue_destroy(flood_queue);