function scr_gate_toggle(argument0) {
	var arg_gate = argument0;

	with(arg_gate)
	{
		is_open = !is_open;
		if(is_open){
			target_frame = 4;
			image_speed = 1;
			solid = false;
		} else {
			target_frame = 0;
			image_speed = -1;
			solid = true;
			scr_check_if_gate_close_plugs_leak();
		}
		// play sound
		if(is_open) resolve_execute(global.script_container, "play_sound_at", sound_fx_door, x, y, false);
		else {} // todo: play closing sound
	}


}
