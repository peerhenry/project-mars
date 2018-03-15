event_inherited();
button_objects = [
	["Next Song", scr_handle_next_song],
	["Previous Song", scr_handle_previous_song],
	["Toggle Music", scr_handle_toggle_music],
	["OK", scr_goto_menu, obj_gui_menu_options], //return to options menu
];
event_user(2); // initialize menu