/// @description Open/close
if(under_construction)
{
	exit;
}
if(!is_open && !locked && global.construct == noone){
	auto_close = false;
	scr_gate_toggle();
}
else{
	auto_close = true;
	//var astronaut_id = collision_rectangle(x-16, y-16, x+16, y+16, obj_character, false, true);
}