/// @arg gui_menu_object_index
function scr_goto_menu(argument0) {
	with(obj_gui_menu)
	{
		event_user(1); // close all menus
	}
	with(argument0)
	{
		event_user(0); // open argument menu //todo: properly create and destroy
	}


}
