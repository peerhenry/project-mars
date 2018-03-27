event_inherited();
text = "Voice";
// Set slider percentage and position
slider.percentage = round(global.settings[? key_settings_sound_volume_voice]);
slider.x = left_limit + slider.percentage*(right_limit - left_limit)/100;