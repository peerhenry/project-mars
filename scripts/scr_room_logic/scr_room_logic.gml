/// @description Room logic happens after construction.
/// @param construct_type
/// @param new_instance
// This is the main entry script behind which all other scripts inside the room logic folder are called.

var construct_type = argument0;
var new_instance = argument1;

with(new_instance){
	var target_x = x;
	var target_y = y;
}

switch(construct_type){
	case build.basetile:
		scr_room_logic_basetile(target_x, target_y);
		break;
	case build.wall:
		scr_room_remove_tile_and_part(target_x, target_y);
		break;
	case build.door:
		scr_room_logic_door(new_instance);
		break;
	case build.hatch:
		scr_room_logic_hatch(new_instance);
		break;
}