event_inherited();
button_objects = [
	["Return to Game", scr_handle_return],
	["Options", scr_handle_options],
	["Save", scr_handle_save],
	["Load", scr_handle_load],
	["Exit to Main Menu", scr_handle_quit],
	["Exit to Desktop", scr_handle_exit]
];
event_user(2); // initialize menu