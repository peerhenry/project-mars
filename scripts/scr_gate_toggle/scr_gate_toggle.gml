is_open = !is_open;

if(is_open){
	target_frame = 4;
	image_speed = 1;
} else {
	target_frame = 0;
	image_speed = -1;
	scr_check_if_gate_close_plugs_leak();
}

// play sound
if(is_open) audio_play_sound(sound_fx_door, 0, 0); // todo: resolve

scr_recalculate_paths();