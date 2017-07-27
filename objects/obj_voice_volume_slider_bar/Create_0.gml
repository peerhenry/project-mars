event_inherited();
text = "Voice";
// Set slider percentage and position
show_debug_message("At voice slider creation, setting percentage to: " + string(global.voice_volume)); // DEBUG
slider.percentage = round(global.voice_volume);
slider.x = left_limit + slider.percentage*(right_limit - left_limit)/100;