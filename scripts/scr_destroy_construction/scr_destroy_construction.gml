/// @param construction
scr_trace("Canceling construction");
debug_type(argument0, macro_type_map);
var arg_construction = argument0;

scr_destroy_construction_piles(arg_construction);
scr_destroy_construction_cells(arg_construction);
scr_unregister_construction(arg_construction);

// Stop astronaut
var astronaut = ds_map_find_value(arg_construction, construction_astronaut);
if(!is_undefined(astronaut) && astronaut != noone)
{
	scr_stop_construction(astronaut);
}
ds_map_replace(arg_construction, construction_astronaut, noone);
ds_map_destroy(arg_construction);