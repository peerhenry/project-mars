/// @arg button
function scr_hud_button_click(argument0) {
	var arg_button = argument0;
	with(arg_button)
	{
		scr_execute_hud_action(action);
		if(toggle_subimg)
		{
			if(subimg == 0) subimg = 1;
			else subimg = 0;
		}
		resolve_execute(global.script_container, "play_sound", sound_click);
	}


}
