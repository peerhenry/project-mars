/// @description Insert description here
// You can write your code in this editor

var mouse_hovers = point_in_rectangle(
	window_mouse_get_x(),
	window_mouse_get_y(),
	btn_left,
	btn_top,
	btn_right,
	btn_bottom
)

if(btn_hover_flag && !mouse_hovers) // mouse just left
{
	btn_bg_color = btn_bg_color_idle;
	btn_color = btn_color_idle;
	btn_hover_flag = false;
	global.hovering_over_HUD = false;
}
else if(!btn_hover_flag && mouse_hovers){	// mouse just entered
	btn_bg_color = btn_bg_color_hover;
	btn_color = btn_color_hover;
	btn_hover_flag = true;
	global.hovering_over_HUD = true;
}