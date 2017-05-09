/// Room logic happens after construction.
// This is the main entry script behind which all other scripts inside the room logic folder are called.

var construct_type = argument0;
var new_instance = argument1;

with(new_instance){
	var target_x = x;
	var target_y = y;
}

switch(construct_type){
	case global.basetile:
		scr_room_logic_basetile(target_x, target_y);
		break;
	case global.wall:
		scr_room_logic_wall(new_instance);
		break;
	case global.door:
		scr_room_logic_door(new_instance);
		break;
	case global.hatch:
		scr_room_logic_hatch(new_instance);
		break;
}