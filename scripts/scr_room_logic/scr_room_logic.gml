/// Call this script after succesful construction of something that can affect rooms.

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