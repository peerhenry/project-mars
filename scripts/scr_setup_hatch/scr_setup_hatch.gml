/// @arg i_tl
/// @arg j_tl
/// @arg rot
function scr_setup_hatch(argument0, argument1, argument2) {
	var i = argument0;
	var j = argument1;
	var rot = argument2;

	var get_layer_for = script_container_resolve(global.script_container, "get_layer_for");
	var hatch_layer = script_execute(get_layer_for, obj_hatch)
	var hatch = instance_create_layer(scr_gi_to_rc(i), scr_gi_to_rc(j), hatch_layer, obj_hatch);
	hatch.connects_horizontally = (rot == 1 || rot == 3);
	scr_finalize(hatch);


}
