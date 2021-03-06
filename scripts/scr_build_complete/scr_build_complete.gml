/// @param construction
var arg_construction = argument0;

var needs_path_recalc = false;
// set completion to 100 and state to done
var build_type = ds_map_find_value(arg_construction, construction_type);
ds_map_replace(arg_construction, construction_completion, 100);
ds_map_replace(arg_construction, construction_build_state, construction_state.done);

// destroy mdu piles
var piles = arg_construction[? construction_mdu_piles];
for(var n = 0; n < ds_list_size(piles); n++)
{
	var next_pile = ds_list_find_value(piles, n);
	show_debug_message("destroying pile that is a: " + object_get_name(next_pile.object_index));
	instance_destroy(next_pile);
}
ds_list_destroy(piles);
ds_map_replace(arg_construction, construction_mdu_piles, noone);

//var construction_cells_array = arg_construction[construction_cells];
var instances_to_finalize = ds_stack_create();
var construction_cells_list = ds_map_find_value(arg_construction, construction_cells);
var cell_count = ds_list_size(construction_cells_list);
var room_logic_instance = noone;
for(var n = 0; n < cell_count; n++) // loop over cells
{
	// - get construction cell parameters
	var next_cell = construction_cells_list[|n];
	var i = next_cell[?c_cell_i];
	var j = next_cell[?c_cell_j];
	var added_instance = next_cell[?c_cell_new_instance];
	var object_to_remove = next_cell[?c_cell_object_to_remove];
	var target_layer = next_cell[?c_cell_layer];
	var cell_x = scr_gi_to_rc(i);
	var cell_y = scr_gi_to_rc(j);
	
	// - remove any removals
	if(object_to_remove != noone)
	{
		var instance = instance_position(cell_x, cell_y, object_to_remove);
		instance_destroy(instance);
		// recalculate paths at the end of this script if there are any removals
		needs_path_recalc = true;
	}
	
	ds_stack_push(instances_to_finalize, added_instance);
}

// Remove from the construction queue
var construction_queue = scr_get_construction_queue(macro_player);
var index = ds_list_find_index(construction_queue, arg_construction);
ds_list_delete(construction_queue, index);

// Stop astronaut
with(obj_task_actor)
{
	if(construction == arg_construction) scr_stop_construction(id);
}

ds_map_replace(arg_construction, construction_astronaut, noone);

// do not destroy because construction may be needed for dependent constructions
// scr_destroy_construction(arg_construction);
// todo: refactor so it can be destroyed

var ciz = arg_construction[? construction_object];
if(ciz != noone)
{
	instance_destroy(ciz);
	ds_map_replace(arg_construction, construction_object, noone);
}

while(!ds_stack_empty(instances_to_finalize))
{
	var next_instance = ds_stack_pop(instances_to_finalize);
	with(next_instance)
	{
		depth = depth + 300;				// Reset normal depth
		event_user(macro_event_finalize);
	}
}
ds_stack_destroy(instances_to_finalize);

if(needs_path_recalc)
{
	scr_recalculate_paths();
}