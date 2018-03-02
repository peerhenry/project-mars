if(entity == noone)
{
	instance_destroy();
	exit;
}

var gui_x = display_mouse_get_x();
var gui_y = display_mouse_get_y();

if( gui_x > left && gui_x < right && gui_y > top && gui_y < bottom ) hover = true;
else hover = false;