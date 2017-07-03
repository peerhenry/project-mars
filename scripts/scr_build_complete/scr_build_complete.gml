/// @param construction
var arg_construction = argument0;

var build_type = arg_construction[construction_build_type];
arg_construction[@construction_completion] = 100; // set completion to 100%
arg_construction[@construction_build_state] = build_state.done;

var construction_cells_array = arg_construction[construction_cells];
var count = array_length_1d(construction_cells_array);

var room_logic_instance = noone;
var i_count = 0;
for(var n = 0; n < count; n++) // loop over tiles
{
	// 1. retrieve data cell
	var next_cell = construction_cells_array[n];
	var i = next_cell[c_cell_i];
	var j = next_cell[c_cell_j];
	var added_instance = next_cell[c_cell_new_instance];
	var object_to_remove = next_cell[c_cell_object_to_remove];
	var map_buffer_action = next_cell[c_cell_map_buffer_action];
	var target_layer = next_cell[c_cell_layer];
	var cell_x = scr_gi_to_rc(i);
	var cell_y = scr_gi_to_rc(j);
	
	// 2. remove object
	if(object_to_remove != noone)
	{
		var instance = instance_position(cell_x, cell_y, object_to_remove);
		with(instance) instance_destroy();
	}
	
	// 3. set map buffer
	scr_execute_map_buffer_action(i, j, map_buffer_action);
	
	// 4. set navgrid
	var instance_is_gate = false;
	with(added_instance)
	{
		if(object_index == obj_door || object_index == obj_hatch) instance_is_gate = true;
	}
	if(
		map_buffer_action == map_buffer_action.inside
		|| map_buffer_action == map_buffer_action.reserve
		|| map_buffer_action == map_buffer_action.clear
		|| map_buffer_action == map_buffer_action.cable
		|| map_buffer_action == map_buffer_action.pipe
		|| instance_is_gate
	)
	{
		scr_navgrid_clear_cell(i, j);
	}
	
	// 5. finalize addad object
	with(added_instance)
	{
		i_count++;
		under_construction = false;
		depth = layer_get_depth(target_layer);
		
		// set instance to perform room logic on.
		switch(build_type)
		{
			case construction.basetile:	// prevents room logic on walls of the basetile.
				if(object_index == obj_base_tile)
				{
					scr_room_logic(build_type, added_instance);
				}
				break;
			case construction.wall:
				scr_room_logic(build_type, added_instance);
				break;
			default:
				room_logic_instance = added_instance;
				break;
		}
		
		scr_wall_logic(added_instance); // wall logic on each instance.
		scr_electric_grid_logic(added_instance);
		scr_post_completion(added_instance);
	}
}

// remove from the construction queue
var construction_queue = global.construction_queue;
var index = ds_list_find_index(construction_queue, arg_construction);
ds_list_delete(construction_queue, index);

// room logic
if(build_type != build.basetile && build_type != build.wall) scr_room_logic(build_type, room_logic_instance);

// stop astronaut
var astronaut = arg_construction[construction_astronaut];
if(astronaut != noone)
{
	scr_stop_construcion(astronaut);
}
arg_construction[@construction_astronaut] = noone; // astronaut assigned to perform the construction