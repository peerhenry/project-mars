/// @arg text
var arg_text = argument0;
var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();
var tt_x = window_mouse_x + 16;
var tt_y = window_mouse_y + 16;
scr_draw_hud_tooltip_at(tt_x, tt_y, arg_text);