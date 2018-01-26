event_inherited();
text = "Voice";
// Set slider percentage and position
slider.percentage = round(global.voice_volume);
slider.x = left_limit + slider.percentage*(right_limit - left_limit)/100;