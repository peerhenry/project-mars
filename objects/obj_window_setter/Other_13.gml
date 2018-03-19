/// @description Set fullscreen or windowed

if(debug_steps && !show_question("Set fullscreen="+string(fullscreen)+"?")) exit;

scr_trace("obj_window_setter: window_set_fullscreen " + string(fullscreen));
window_set_fullscreen(fullscreen); //if setting it to fullscreen (true), window_set_size() won't have any effect.
global.window_fullscreen = fullscreen;