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
	if(is_open)
	{
		var play_sound = resolve(script_container, "play_sound");
		script_execute(play_sound, sound_fx_door);
	}
}

// scr_recalculate_paths();