
level = noone;
top = 0;
left = 0;
pad = 8;
line_space = 4;
height = 100;
//font = font_small;
font = font_small_bold;

with(obj_level)
{
	other.level = id;
}

// show_debug_message("level: " + string(level));
// show_debug_message("global.level_object_index: " + object_get_name(global.level_object_index));

with(obj_HUD)
{
	other.top = hud_bar_h;
}