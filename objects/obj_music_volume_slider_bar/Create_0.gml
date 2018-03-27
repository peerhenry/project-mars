event_inherited();
text = "Music";
// Set slider percentage and position
slider.percentage = round(global.settings[? key_settings_sound_volume_music]);
slider.x = left_limit + slider.percentage*(right_limit - left_limit)/100;