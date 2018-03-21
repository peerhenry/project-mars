/// @arg gui_button
// todo: finish
with(argument0)
{
	var wmx = window_mouse_get_x();
	var wmy = window_mouse_get_y();
	hover = wmx >= left && wmx <= right && wmy >= top && wmy <= bottom;
}