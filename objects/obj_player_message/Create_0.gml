text = "";
alarm[0] = 30*4; // 4 seconds
top = 44;

if( !audio_is_playing(sound_fx_notify) )
{
	resolve_execute(global.script_container, "play_sound", sound_fx_notify);
}