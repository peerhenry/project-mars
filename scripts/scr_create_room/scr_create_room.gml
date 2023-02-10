/// @Description Creates a new room object, given coordinate must be inside the room.
/// @param x
/// @param y
function scr_create_room(argument0, argument1) {
	var arg_x = argument0;
	var arg_y = argument1;

	var or_x = scr_rc_clamp_origin(arg_x);
	var or_y = scr_rc_clamp_origin(arg_y);

	var container = global.script_container;
	var get_layer = script_container_resolve(container, "get_layer_for");
	var rooms_layer = script_execute(get_layer, obj_room);
	var new_room = instance_create_layer(arg_x, arg_y, rooms_layer, obj_room);
	var base_tile = instance_position(arg_x, arg_y, obj_base_tile);
	with(new_room){
		bb_left = or_x;
		bb_top = or_y;
		bb_right = bb_left + 32;
		bb_bottom = bb_top + 32;
	}

	var o2_grid = scr_get_grid(base_tile, macro_grid_oxygen);
	scr_connect_to_grid(o2_grid, new_room);

	return new_room;


}
