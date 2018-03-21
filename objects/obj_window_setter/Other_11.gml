/// @description Set window size and position

// resume current window size
if(width == -1) width = global.window[? key_window_width];
if(height == -1) height = global.window[? key_window_height];

// auto full display size
if(width == -2) width = display_get_width();
if(height == -2) height = display_get_height();

// resume current window position
if(window_x == -1) window_x = global.window[? key_window_x];
if(window_y == -1) window_y = global.window[? key_window_y];
		
// auto recenter window position (or set to 0,0 when too large) // warning: will recenter at primary monitor!!
if(window_x == -2) window_x = (width > display_get_width()) ? 0 : display_get_width() / 2 - width / 2;
if(window_y == -2) window_y = (height > display_get_height()) ? 0 : display_get_height() / 2 - height / 2;

if(debug_steps && !show_question("Set window size="+string(width)+"x"+string(height)+" and pos="+string(window_x)+","+string(window_y)+"?")) exit;
		
scr_trace("obj_window_setter: window_set_size " + string(width) + "x" + string(height));
window_set_size(width, height); //this is the only function that needs to run on a separate step. I've found it will not work correctly if used in the same step as the other functions
global.window[? key_window_width] = width;
global.window[? key_window_height] = height;

scr_trace("obj_window_setter: window_set_position " + string(window_x) + "x" + string(window_y));
window_set_position(window_x, window_y);
global.window[? key_window_x] = window_x;
global.window[? key_window_y] = window_y;