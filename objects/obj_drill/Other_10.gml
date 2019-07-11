/// @description Grid has updated

var can_draw_power = resolve_execute(script_container, "can_draw_power", id);
if(can_draw_power)
{
	if(drill_sound == noone)
	{
		drill_sound = resolve_execute(script_container, "play_sound_at_ext", sound_fx_drill, x, y, true, 100, 400, 1, 0.2);
	}
	image_speed = 1;
}
else	// low power
{
	audio_stop_sound(drill_sound);
	drill_sound = noone;
	image_index = 0;
	image_speed = 0;
}