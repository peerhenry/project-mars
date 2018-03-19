event_inherited();
button_objects = [
	["Return to Game", scr_handle_return],
	["Options", scr_goto_menu, obj_gui_menu_options],
	["Save", scr_handle_save],
	["Load", scr_handle_load],
	["Exit to Main Menu", scr_handle_quit],
	["Exit to Desktop", scr_handle_exit]
];
if(global.dev_env) button_objects[array_length_1d(button_objects)] = ["Debug", scr_goto_menu, obj_gui_menu_debug];
event_user(2); // initialize menu