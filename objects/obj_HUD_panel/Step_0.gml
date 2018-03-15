if(global.mousedrag_from != mousedrag_from.none) exit; // prevent step when dragging into this from outside

var window_mouse_x = window_mouse_get_x();
var window_mouse_y = window_mouse_get_y();

var mouse_over = window_mouse_x > left && 
	window_mouse_x < right && 
	window_mouse_y > top && 
	window_mouse_y < bottom;
	
if(mouse_over) hovers = true;
else hovers = false;