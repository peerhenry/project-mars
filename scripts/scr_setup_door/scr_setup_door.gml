/// @arg i_tl
/// @arg j_tl
/// @arg rot
function scr_setup_door(argument0, argument1, argument2) {
	var i = argument0;
	var j = argument1;
	var rot = argument2;

	var map_value = scr_map_buffer_get_cell(i, j);
	var map_i = (map_value & 1);
	if(map_i != 1)
	{
		scr_warn("scr_setup_door called on an outside cell!");
		exit;
	}

	var get_layer_for = script_container_resolve(global.script_container, "get_layer_for");
	var door_layer = script_execute(get_layer_for, obj_door)
	var door = instance_create_layer(scr_gi_to_rc(i), scr_gi_to_rc(j), door_layer, obj_door);
	door.connects_horizontally = (rot == 1 || rot == 3);
	scr_finalize(door);


}
