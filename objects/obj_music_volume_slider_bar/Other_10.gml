/// @description On change
audio_group_set_gain(audiogroup_music, slider.percentage/100, 0);
global.settings[? key_settings_sound_volume_music] = slider.percentage;