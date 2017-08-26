/// @description Insert description here
// You can write your code in this editor
use_shader=!use_shader;
if(use_shader)
{
	application_surface_draw_enable(false);
}
else
{
	application_surface_draw_enable(true);
}
show_debug_message("use_shader set to: " + string(use_shader));