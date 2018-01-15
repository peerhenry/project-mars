enum menu_index{
	game_continue,
	new_game,
	tutorial,
	skirmish,
	survival,
	settings,
	debug,
	quit
}

// highest index first
menu[menu_index.quit] = "";

menu[menu_index.game_continue] = "Continue";
menu[menu_index.new_game] = "New Game";
menu[menu_index.tutorial] = "Tutorial";
menu[menu_index.skirmish] = "Skirmish";
menu[menu_index.survival] = "Survival";
menu[menu_index.settings] = "Settings";
menu[menu_index.debug] = "Test Level";
//menu[menu_index.test] = "Test";
menu[menu_index.quit] = "Quit";
menu_index_max = array_length_1d(menu) - 1;

// highest index first
colors[menu_index.quit] = c_white;
colors[menu_index.game_continue] = c_gray;
colors[menu_index.new_game] = c_gray;
colors[menu_index.tutorial] = c_white;
colors[menu_index.survival] = c_white;
colors[menu_index.settings] = c_white;
colors[menu_index.skirmish] = c_gray;
colors[menu_index.debug] = c_white;
//colors[menu_index.test] = c_gray;

space = 64;
menu_focus_index = 0;
mark_for_go = false;