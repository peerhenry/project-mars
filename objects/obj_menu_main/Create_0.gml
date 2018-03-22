event_inherited(); //todo: put mainmenu stuff in seperate folder, like settings and skirmish, rest goes to e.g.: misc/helpers

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

// highest index first (to initialize the array size)
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

// highest index first
colors[menu_index.quit] = c_white;
colors[menu_index.game_continue] = c_gray;
colors[menu_index.new_game] = c_white;
colors[menu_index.tutorial] = c_white;
colors[menu_index.survival] = c_white;
colors[menu_index.settings] = c_white;
colors[menu_index.skirmish] = c_white;
colors[menu_index.debug] = c_white;
//colors[menu_index.test] = c_gray;

global.mission_control_return_room = room_menu;