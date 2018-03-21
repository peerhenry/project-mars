enum settings_index //todo: discuss refactor/naming?
{
	back
}

// highest index first //todo: discuss why
menu[settings_index.back] = "Back";

menu_index_max = array_length_1d(menu) - 1;

space = 64;
menu_focus_index = 0;
mark_for_go = false;