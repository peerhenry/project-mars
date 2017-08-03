/// @param width
/// @param height
var arg_width = argument0;
var arg_height = argument1;

global.resolution_width = arg_width;
global.resolution_height = arg_height;

// Set the size of GUI
display_set_gui_size(arg_width, arg_height);

// Set the size of the game window
window_set_size(arg_width, arg_height);

// Set the resolution we've programmed the game for
var baseWidth = 1920;
var baseHeight = 1080;

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

// window_center();