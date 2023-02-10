/// @arg button
function scr_gui_item_step_state_button_color(argument0) {
	with(argument0)
	{	
		var state = script_execute(get_state_script, id);
		sprite_color = state ? c_aqua : c_black;
	}


}
