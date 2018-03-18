/// @description Window initializer called at boot only

window_set_caption(scr_get_application_info());
window_set_max_width(macro_window_max_width);
window_set_max_height(macro_window_max_height);
window_set_min_width(macro_window_min_width);
window_set_min_height(macro_window_min_height);

global.monitor_width = display_get_width();
global.monitor_height = display_get_height();
// monitor width and height may not be supported by game...

//todo: where to store window vars? currently via globals
//todo: window_needs_recenter via listener?

//scr_resolution(window_width, window_height);
//window_set_fullscreen(window_fullscreen);
//window_center();

// load settings
var settings = global.settings;
var window_width = settings[? "window_width"];
var window_height = settings[? "window_height"];
var window_fullscreen = settings[? "window_fullscreen"];
var window_aa_level = settings[? "window_aa_level"];
var window_vsync = settings[? "window_vsync"];
var window_x = macro_init_window_x;
var window_y = macro_init_window_y;

// init resolutions cycler
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

global.window_aa_level = 0; //use GMS default
global.window_vsync = false; //use GMS default

//show supported aa levels
var supported = "";
for(var aa = 2; aa <= display_aa; aa *= 2)
{
	if((aa & display_aa) == aa)
	{
		if(supported != "") supported += ", ";
		supported += string(aa)
	}
}
if(supported == "") supported = "none";
scr_force_trace("Supported AA-levels: " + supported);

scr_set_window_async(window_width, window_height, window_fullscreen, window_aa_level, window_vsync, window_x, window_y, scr_preload);