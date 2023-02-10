function scr_handle_exit() {
	with(obj_gui_menu_main)
	{
		event_user(1); // close main menu
	}

	instance_create_layer(scr_exit, scr_handle_menu, macro_logic_layer, obj_gui_menu_confirm);

	with(obj_gui_menu_confirm)
	{
		event_user(0);
		confirm_text = "Exit to Desktop";
	}


}
