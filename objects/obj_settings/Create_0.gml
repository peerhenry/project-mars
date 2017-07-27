enum settings_index{
	back
}

// highest index first
menu[settings_index.back] = "Back";

menu_index_max = array_length_1d(menu) - 1;

space = 64;
menu_focus_index = 0;
mark_for_go = false;