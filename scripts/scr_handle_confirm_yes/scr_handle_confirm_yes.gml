with(obj_gui_menu_confirm)
{
	confirm_state = true;
	event_user(1); // close confirm dialog
}
with(obj_gui_menu_main)
{
	event_user(0); // open menu
}