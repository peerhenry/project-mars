with(obj_res_dropdown)
{
	text = other.text;
	// select event
	
	//todo: wait for callback?
	//todo: show confirm dialog after setting?
	//todo: after confirm save to ini?
	//todo: check all other places that need to write window state to ini?
	scr_set_window(other.width, other.height, -1, -1, -1, -1, -1, noone);
	//todo: set the current resolution index in global.window
}
with(obj_res_dropdown_item)
{
	instance_destroy();
}