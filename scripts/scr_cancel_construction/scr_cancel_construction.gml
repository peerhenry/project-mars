/// @param construction
scr_trace("Canceling construction");
debug_type(argument0, macro_type_map);
var arg_construction = argument0;

// Replace MDU piles
var build_type = ds_map_find_value(arg_construction, construction_build_type);
ds_map_replace(arg_construction, construction_completion, 100);
ds_map_replace(arg_construction, construction_build_state, construction_state.done);
var piles = arg_construction[? construction_mdu_piles];
for(var n = 0; n < ds_list_size(piles); n++)
{
	var next_pile = ds_list_find_value(piles, n);
	var mdu_pile = instance_create_depth(next_pile.x, next_pile.y, macro_base_tall_layer, obj_mdu_pile);
	mdu_pile.image_index = next_pile.image_index;
	mdu_pile.mdu_count = next_pile.image_index;
	instance_destroy(next_pile);
}
ds_list_destroy(piles);

// Destroy construction cells
var construction_cells_array = ds_map_find_value(arg_construction, construction_cells);
var count = array_length_1d(construction_cells_array);
var room_logic_instance = noone;
for(var n = 0; n < count; n++) // loop over tiles
{
	var next_cell = construction_cells_array[n];
	var added_instance = next_cell[c_cell_new_instance];
	with(added_instance)
	{
		instance_destroy();
	}
	construction_cells_array[@n] = 0;
}
ds_map_replace(arg_construction, construction_cells, 0);

// Remove from the construction queue
var construction_queue = scr_get_construction_queue(arg_construction[? construction_owner]);
var index = ds_list_find_index(construction_queue, arg_construction);
ds_list_delete(construction_queue, index);

// Stop astronaut
var astronaut = ds_map_find_value(arg_construction, construction_astronaut);
if(!is_undefined(astronaut) && astronaut != noone)
{
	scr_stop_construcion(astronaut);
}
ds_map_replace(arg_construction, construction_astronaut, noone);
ds_map_destroy(arg_construction);