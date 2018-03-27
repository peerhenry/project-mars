event_inherited();
text = "Sound Effects";
// Set slider percentage and position
slider.percentage = round(global.settings[? key_settings_sound_volume_sfx]);
slider.x = left_limit + slider.percentage*(right_limit - left_limit)/100;