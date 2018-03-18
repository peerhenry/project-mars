
level = noone;
top = 0;
left = 0;
pad = 8;
line_space = 4;
height = 0;
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

font_height = font_get_size(font);
line_height = sprite_get_height(spr_checked);
line_offset = line_space + line_height;
prev_nr_of_objectives = 0; // height is recalculated of nr of objectives change