/// @description On change
audio_group_set_gain(audiogroup_sfx, slider.percentage/100, 0);
global.settings[? key_settings_sound_volume_sfx] = slider.percentage;
if(!audio_is_playing(sound_fx_laser))
{
	audio_play_sound(sound_fx_laser, 0, 0);
}