/// @description Set window asynchronous via obj_window_setter
/// @arg width
/// @arg height
/// @arg fullscreen
/// @arg aa_level
/// @arg vsync
/// @arg window_x
/// @arg window_y
/// @arg callback

var window_setter = instance_create_depth(0, 0, 0, obj_window_setter);
window_setter.width = argument0;
window_setter.height = argument1;
window_setter.fullscreen = argument2;
window_setter.aa_level = argument3;
window_setter.vsync = argument4;
window_setter.window_x = argument5;
window_setter.window_y = argument6;
window_setter.callback = argument7;