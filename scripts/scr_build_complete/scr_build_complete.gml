/// @param construction
var arg_construction = argument0;

var build_type = arg_construction[construction_build_type];
arg_construction[@construction_completion] = 100; // set completion to 100%
arg_construction[@construction_build_state] = construction_state.done;

var construction_cells_array = arg_construction[construction_cells];
var count = array_length_1d(construction_cells_array);

var room_logic_instance = noone;
for(var n = 0; n < count; n++) // loop over tiles
{
	// - get construction cell parameters
	var next_cell = construction_cells_array[n];
	var i = next_cell[c_cell_i];
	var j = next_cell[c_cell_j];
	var added_instance = next_cell[c_cell_new_instance];
	var object_to_remove = next_cell[c_cell_object_to_remove];
	var target_layer = next_cell[c_cell_layer];
	var cell_x = scr_gi_to_rc(i);
	var cell_y = scr_gi_to_rc(j);
	
	// - remove object
	if(object_to_remove != noone)
	{
		var instance = instance_position(cell_x, cell_y, object_to_remove);
		with(instance) instance_destroy();
	}
	
	// - finalize added object
	scr_build_instance_finalize(added_instance, target_layer, build_type);
	with(added_instance)
	{
		depth = depth + 300; // reset normal depth
	}
}

// remove from the construction queue
var construction_queue = global.construction_queue;
var index = ds_list_find_index(construction_queue, arg_construction);
ds_list_delete(construction_queue, index);

// old: room logic; now part of scr_build_instance_finalize
//if(build_type != macro_basetile && build_type != macro_wall) scr_room_logic(build_type, room_logic_instance);

// stop astronaut
var astronaut = arg_construction[construction_astronaut];
if(astronaut != noone)
{
	scr_stop_construcion(astronaut);
}
arg_construction[@construction_astronaut] = noone; // astronaut assigned to perform the construction