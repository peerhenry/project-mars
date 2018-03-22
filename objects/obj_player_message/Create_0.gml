event_inherited();
text = "";
alarm[0] = 30*4; // 4 seconds
top = 44;
width = 200;
height = 120;
left = 8;
bottom = top + height;
right = left + width;
draw_script = noone; // custom draw

if( !audio_is_playing(sound_fx_notify) )
{
	resolve_execute(global.script_container, "play_sound", sound_fx_notify);
}