/// @description Print debug info for actual window settings

show_debug_message("DEBUG WINDOW INFO >>");
show_debug_message("Display size: " + string(display_get_width()) + "x" + string(display_get_height()));
show_debug_message("Window size: " + string(window_get_width()) + "x" + string(window_get_height()));
show_debug_message("Window pos: " + string(window_get_x()) + "," + string(window_get_y()));
show_debug_message("Fullscreen: " + string(window_get_fullscreen()));
show_debug_message("Application surface size: " + string(surface_get_width(application_surface)) + "x" + string(surface_get_height(application_surface)));
show_debug_message("Application surface draw enabled: " + string(application_surface_is_enabled()));
show_debug_message("GUI size: " + string(display_get_gui_width()) + "x" + string(display_get_gui_height()));
show_debug_message("View enabled: " + string(view_enabled));
if(view_enabled)
{
	show_debug_message("View current: " + string(view_current));
	show_debug_message("View[" + string(view_current) + "] port: " + string(view_wport[view_current]) + "x" + string(view_hport[view_current]) + " at " + string(view_xport[view_current]) + "," + string(view_yport[view_current]));
	
	var cam = view_get_camera(view_current);
	show_debug_message("View[" + string(view_current) + "] camera: " + string(cam));
	if(cam > -1) //-1 = no cam assigned
	{
		show_debug_message("Camera size: " + string(camera_get_view_width(cam)) + "x" + string(camera_get_view_height(cam)));
		show_debug_message("Camera pos: " + string(camera_get_view_x(cam)) + "," + string(camera_get_view_y(cam)));
	}
}