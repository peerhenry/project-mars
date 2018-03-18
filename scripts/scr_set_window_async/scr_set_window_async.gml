var arg_width = argument0;
var arg_height = argument1;
var arg_fullscreen = argument2;
var arg_aa_level = argument3;
var arg_vsync = argument4;
var arg_display_x = argument5;
var arg_display_y = argument6;
var arg_callback = argument7;

var window_setter = instance_create_depth(0, 0, 0, obj_window_setter);
with(window_setter)
{
	width = arg_width;
	height = arg_height;
	fullscreen = arg_fullscreen;
	aa_level = arg_aa_level;
	vsync = arg_vsync;
	display_x = arg_display_x;
	display_y = arg_display_y;
	callback = arg_callback;
}