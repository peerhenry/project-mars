//var displayWidth = display_get_width();
//var displayHeight = display_get_height();
var arg_width = argument0;
var arg_height = argument1;

/*show_debug_message("scr_resolution called:");
show_debug_message("width: " + string(arg_width));
show_debug_message("height: " + string(arg_height));*/

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