event_inherited();
text = "Music";
// Set slider percentage and position
slider.percentage = round(global.music_volume);
slider.x = left_limit + slider.percentage*(right_limit - left_limit)/100;