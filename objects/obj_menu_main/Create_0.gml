event_inherited(); //todo: put mainmenu stuff in seperate folder, like settings and skirmish, rest goes to e.g.: misc/helpers
global.mission_control_return_room = room_menu; //todo: define centrally + should be default?

enum menu_index
{
	game_continue,
	new_game,
	tutorial,
	skirmish,
	survival,
	settings,
	debug,
	quit
}

list_items = [
	["Continue", menu_index.game_continue, false], //todo: conditionally disabled
	["New Game", menu_index.new_game],
	["Tutorial", menu_index.tutorial],
	["Skirmish", menu_index.skirmish],
	["Survival", menu_index.survival],
	["Settings", menu_index.settings],
	["Test Level", menu_index.debug],
	["Quit", menu_index.quit]
];

event_user(2); //initialize list buttons