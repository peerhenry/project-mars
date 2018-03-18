/// @description Window initializer called at boot only

window_set_caption(scr_get_application_info());
window_set_max_width(macro_window_max_width);
window_set_max_height(macro_window_max_height);
window_set_min_width(macro_window_min_width);
window_set_min_height(macro_window_min_height);

global.monitor_width = display_get_width();
global.monitor_height = display_get_height();
// monitor width and height may not be supported by game...

//todo: resolutions cycler?
//todo: where to store window vars? currently via globals
//todo: window_needs_recenter via listener?

//scr_resolution(window_width, window_height);
//window_set_fullscreen(window_fullscreen);
//window_center();

var settings = global.settings;
var window_width = settings[? "window_width"];
var window_height = settings[? "window_height"];
var window_fullscreen = settings[? "window_fullscreen"];
var window_aa_level = settings[? "window_aa_level"];
var window_vsync = settings[? "window_vsync"];
var window_x = macro_init_window_x;
var window_y = macro_init_window_y;
scr_set_window_async(window_width, window_height, window_fullscreen, window_aa_level, window_vsync, window_x, window_y, scr_preload);