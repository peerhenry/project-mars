show_debug_message("---> scr_handle_menu opens main menu");
with(obj_gui_menu)
{
	event_user(1); // close all menus
}
with(obj_gui_menu_main)
{
	event_user(0); // open main menu
}