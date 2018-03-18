/// @param width
/// @param height
var arg_width = argument0;
var arg_height = argument1;

var window_x = global.window_x;
var window_y = global.window_y;

var windowed_info = global.window_fullscreen ? "" : " (windowed at " + string(window_x) + "," + string(window_y) + ")";
scr_force_trace("Set resolution: " + string(arg_width) + "x" + string(arg_height) + windowed_info);

global.window_width = arg_width;
global.window_height = arg_height;

// Set view port
view_wport[0] = arg_width;
view_hport[0] = arg_height;

// Set surface
surface_resize(application_surface, arg_width, arg_height);

// Set the size of the game window
scr_force_trace("Set window at: " + string(global.window_x) + "," + string(global.window_y));
//window_set_size(arg_width, arg_height);
window_set_rectangle(global.window_x, global.window_y, arg_width, arg_height);

// Set the size of GUI
display_set_gui_size(arg_width, arg_height);

/*
// Set the resolution we've programmed the game for
var baseWidth = macro_window_base_width;
var baseHeight = macro_window_base_height;

// Determine aspect ratio
var aspect = baseWidth/baseHeight;

// Work out the adjusted height and width to maintain aspect ratio
var height = min(baseHeight, arg_height);
var width = height * aspect;

// Resize the application surface to adjusted values
surface_resize(application_surface, width, height);

//scr_zoom(width, height);
var cam = view_camera[0];
if(arg_width <= baseWidth/2 && height <= baseHeight/2)
{
	camera_set_view_size(cam, width*2, height*2);
}
else
{
	camera_set_view_size(cam, width, height);
}
*/

var cam = view_camera[0];
camera_set_view_size(cam, arg_width, arg_height);

// window_center();