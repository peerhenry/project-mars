enum menu_index{
	game_continue,
	new_game,
	tutorial,
	options,
	debug,
	test,
	quit
}

// highest index first
menu[menu_index.quit] = "";

menu[menu_index.game_continue] = "Continue";
menu[menu_index.new_game] = "New Game";
menu[menu_index.tutorial] = "Tutorial";
menu[menu_index.options] = "Options";
menu[menu_index.debug] = "Debug";
menu[menu_index.test] = "Test";
menu[menu_index.quit] = "Quit";
menu_index_max = array_length_1d(menu) - 1;

space = 64;
menu_focus_index = 0;
mark_for_go = false;