/// @description On change
audio_group_set_gain(audiogroup_voice, slider.percentage/100, 0);
global.voice_volume = slider.percentage;
var s = irandom(2);
var chosen = noone;
switch s
{
	case 0: chosen = sound_cmd_yep; break;
	case 1: chosen = sound_cmd_understood; break;
	case 2:	chosen = sound_cmd_acknowledged; break;
}

if(
	!audio_is_playing(sound_cmd_yep)
	&& !audio_is_playing(sound_cmd_understood)
	&& !audio_is_playing(sound_cmd_acknowledged)
)
{
	audio_play_sound(chosen, 1, false);
}