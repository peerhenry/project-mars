if(begin_landing_animation)
{
	if(!audio_is_playing(sound_fx_exhaust)) resolve_execute(global.script_container, "play_sound", sound_fx_exhaust);
	begin_landing_animation = false;
	
	if(!path_exists(path)) path = path_add();
	//mp_linear_path(path, basetile_target.x, basetile_target.y, worm_speed_underground, false); // does not go through solids
	y = y - 1080;
	path_add_point(path, x, y - 1080, 100);
	path_add_point(path, x, y, 10);
	path_set_closed(path, false); // so it doesnt go back
	var landing_speed = 30; // todo: move to config global
	path_start(path, landing_speed, path_action_stop, false);
}
if(is_landing)
{
	image_index = 1;
	occ_j = scr_rc_to_gi(y);
	if(path_position == 1)
	{
		if(audio_is_playing(sound_fx_exhaust)) audio_stop_sound(sound_fx_exhaust);
		image_index = 0;
		is_landing = false;
		path_delete(path);
	}
}
else event_inherited();