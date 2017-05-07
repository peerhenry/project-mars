/// @description Open/close
if(!is_open && !locked){
	auto_close = false;
	scr_door_toggle();
}
else{
	auto_close = true;
	//var astronaut_id = collision_rectangle(x-16, y-16, x+16, y+16, obj_character, false, true);
}