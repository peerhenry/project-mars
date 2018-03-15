with(obj_gui_menu_main)
{
	event_user(1); // close main menu
}
with(obj_gui_menu_confirm)
{
	event_user(0); // open (toggle) confirm dialog
	confirm_text = "Exit to Main Menu";
	yes_callback = scr_quit;
	no_callback = noone;
}