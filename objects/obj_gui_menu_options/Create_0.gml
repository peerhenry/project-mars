event_inherited();
button_objects = [
	["Sound", scr_goto_menu, obj_gui_menu_sound],
	["Controls", scr_goto_menu, obj_gui_menu_controls],
	["OK", scr_goto_menu, obj_gui_menu_main]
];
event_user(2); // initialize menu