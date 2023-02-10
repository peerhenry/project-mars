/// @param construction
function scr_destroy_construction(argument0) {
	scr_trace("Destroying construction");
	debug_type(argument0, macro_type_map);
	var arg_construction = argument0;

	scr_destroy_construction_piles(arg_construction);
	scr_destroy_construction_cells(arg_construction);
	scr_unregister_construction(arg_construction);

	// Stop astronauts
	with(obj_astronaut)
	{
		if(construction == arg_construction) scr_stop_construction(id);
	}
	with(arg_construction[? construction_object]) instance_destroy();
	arg_construction[? construction_object] = noone;
	ds_map_destroy(arg_construction);


}
