/// @description Open/close
if(owner != macro_player) exit;
if(under_construction || under_destruction)
{
	exit;
}
if(!is_open && !locked && scr_get_selected_constr_type() == noone){
	auto_close = false;
	scr_gate_toggle();
}
else{
	auto_close = true;
	//var astronaut_id = collision_rectangle(x-16, y-16, x+16, y+16, obj_character, false, true);
}