/// @description Window initializer called at boot only

// Set window caption
window_set_caption(scr_get_application_info());

// Set resizing bounds (-1 = no limit) only used when window resizing is enabled via project options
window_set_max_width(macro_window_max_width);
window_set_max_height(macro_window_max_height);
window_set_min_width(macro_window_min_width);
window_set_min_height(macro_window_min_height);

// Detect display size
global.monitor_width = display_get_width();
global.monitor_height = display_get_height();
// monitor width and height may not be supported by game... and may change when window is dragged to another monitor with different resolution?
show_debug_message("Detected display size: " + string(display_get_width()) + "x" + string(display_get_height()));

// Show supported aa levels
scr_debug_supported_aa_levels();

// Load settings //todo: where to store window vars? currently via global.settings
var settings = global.settings;
var window_width = settings[? "window_width"];
var window_height = settings[? "window_height"];
var window_fullscreen = settings[? "window_fullscreen"];
var window_aa_level = settings[? "window_aa_level"];
var window_vsync = settings[? "window_vsync"];
var window_x = macro_init_window_x;
var window_y = macro_init_window_y;

// Auto size window
if(window_width == -1) window_width = display_get_width();
if(window_height == -1) window_height = display_get_height();

// Init resolutions cycler //todo: link with settings screen
var resolutions = ds_list_create();
ds_list_add(resolutions, [640, 480], [800, 600], [1024, 768], [1152, 864], [1280, 720], [1280, 768], [1280, 800], [1280, 960], [1280, 1024], [1600, 1200], [1680, 1050], [1920, 1080], [1920, 1200]);
var current_resolution = -1;
for(var i = 0; i < ds_list_size(resolutions); i++)
{
	var item = resolutions[|i];
	if(item[0] == window_width && item[1] == window_height)
	{
		current_resolution = i;
		break;
	}
}
global.resolutions_list = resolutions;
global.resolutions_current = current_resolution;

// Init AA and vsync
global.window_aa_level = 0; //needs to initialize as 0
global.window_vsync = false; //needs to initialize as false

// Set window async, when done start preloader
scr_set_window_async(window_width, window_height, window_fullscreen, window_aa_level, window_vsync, window_x, window_y, scr_preload);
exit; //last line of code