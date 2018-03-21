/// @description Set fullscreen or windowed

// resume current fullscreen state
if(fullscreen == -1) fullscreen = global.window[? key_window_fullscreen]; //todo: refactor use -1 when calling instead of passing global.window (e.g. in debug key listener)

//auto toggle fullscreen
if(fullscreen == -2) fullscreen = !global.window[? key_window_fullscreen];

if(debug_steps && !show_question("Set fullscreen="+string(fullscreen)+"?")) exit;

scr_trace("obj_window_setter: window_set_fullscreen " + string(fullscreen));
window_set_fullscreen(fullscreen); //if setting it to fullscreen (true), window_set_size() won't have any effect.
//todo: warning: when turning off fullscreen, the window height is modified to include the window titlebar (= smaller content rectangle)
global.window[? key_window_fullscreen] = fullscreen;