/// @description Set window size and position

// resume current window position
if(display_x == -1) display_x = window_get_x();
if(display_y == -1) display_y = window_get_y();
		
// auto recenter window position (or set to 0,0 when too large) // warning: will recenter at primary monitor!!
if(display_x == -2) display_x = (width > display_get_width()) ? 0 : display_get_width() / 2 - width / 2;
if(display_y == -2) display_y = (height > display_get_height()) ? 0 : display_get_height() / 2 - height / 2;

if(debug_steps && !show_question("Set window size="+string(width)+"x"+string(height)+" and pos="+string(display_x)+","+string(display_y)+"?")) exit;
		
scr_trace("obj_window_setter: window_set_size " + string(width) + "x" + string(height));
window_set_size(width, height); //this is the only function that needs to run on a separate step. I've found it will not work correctly if used in the same step as the other functions
global.window_width = width;
global.window_height = height;

scr_trace("obj_window_setter: window_set_position " + string(display_x) + "x" + string(display_y));
window_set_position(display_x, display_y);
global.window_x = display_x;
global.window_y = display_y;