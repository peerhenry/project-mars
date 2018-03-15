event_inherited();
button_objects = [
	["Sound", scr_handle_sound],
	["Controls", scr_handle_controls],
	["OK", scr_handle_menu], //return to main menu
];
esc_callback = scr_handle_menu;
event_user(2); // initialize menu