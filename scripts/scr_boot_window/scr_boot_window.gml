/// @description Window initializer called at boot only

// Set window caption
window_set_caption(scr_get_application_info());

// Set resizing bounds (-1 = no limit) only used when window resizing is enabled via project options
window_set_max_width(default_window_max_width);
window_set_max_height(default_window_max_height);
window_set_min_width(default_window_min_width);
window_set_min_height(default_window_min_height);

// Detect display size
show_debug_message("Detected display size: " + scr_format_size(display_get_width(), display_get_height()));

// Show supported aa levels
debug_supported_aa_levels();

// Load settings
var settings = global.settings;
var window_width = settings[? key_settings_window_width];
var window_height = settings[? key_settings_window_height];
var window_fullscreen = settings[? key_settings_window_fullscreen];
var window_aa_level = settings[? key_settings_window_aa_level];
var window_vsync = settings[? key_settings_window_vsync];
var window_x = settings[? key_settings_window_x];
var window_y = settings[? key_settings_window_y];

// Auto size window //todo: use same settings as obj_window_setter (e.g.: -2 is auto) //todo: implement -3 = read from current and -2 = read from state global.window?
if(window_width == -1) window_width = display_get_width();
if(window_height == -1) window_height = display_get_height();

// Init resolutions cycler
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

// Init window state
var window = ds_map_create();
window[? key_window_resolutions_list] = resolutions;
window[? key_window_resolutions_current] = current_resolution;
window[? key_window_width] = window_width;
window[? key_window_height] = window_height;
window[? key_window_fullscreen] = window_fullscreen;
window[? key_window_aa_level] = 0; //needs to initialize as 0
window[? key_window_vsync] = false; //needs to initialize as false
window[? key_window_x] = window_x;
window[? key_window_y] = window_y;
global.window = window;

// Set window async, when done start preloader
scr_set_window(window_width, window_height, window_fullscreen, window_aa_level, window_vsync, window_x, window_y, scr_preload);  //important: needs to be last line of code
exit;