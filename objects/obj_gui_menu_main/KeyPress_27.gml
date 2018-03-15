if(is_active) event_inherited(); //close this
else
{
	var any_menu_active = false;
	with(obj_gui_menu)
	{
		if(is_active) any_menu_active = true;
	}
	if(!any_menu_active) scr_handle_menu(); //activate main menu if no other menus were active
}