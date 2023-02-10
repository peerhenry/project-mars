/// @param instance
function scr_destroy_instance_grid_logic(argument0) {
	var arg_instance = argument0;
	debug_instance_inherits(arg_instance, obj_constructable);
	debug_type(arg_instance.grid_props_map, macro_type_map);
	scr_trace("destroy instance grid logic");

	scr_decouple_from_grid(arg_instance);
	scr_destroy_grid_props(arg_instance);


}
