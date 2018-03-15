if(!instance_exists(entity) || entity == noone)
{
	instance_destroy();
	with(obj_HUD_outliner) reset = true;
	exit;
}

if(global.mousedrag_from == mousedrag_from.world) exit; //prevent hover when dragging into from outside

var mouse_gui_x = window_mouse_get_x();
var mouse_gui_y = window_mouse_get_y();

if( 
	mouse_gui_x > left 
	&& mouse_gui_x < right 
	&& mouse_gui_y > top 
	&& mouse_gui_y < top + panel_height
) hover = true;
else hover = false;