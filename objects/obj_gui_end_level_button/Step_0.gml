var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

hover = window_mouse_x > left && 
	window_mouse_x < right && 
	window_mouse_y > top && 
	window_mouse_y < bottom;