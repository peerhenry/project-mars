event_inherited();
button_objects = [
	["Window Test", scr_exit_level_to, room_window_test],
	["Back", scr_goto_menu, obj_gui_menu_main], //return to main menu
];
event_user(2); // initialize menu