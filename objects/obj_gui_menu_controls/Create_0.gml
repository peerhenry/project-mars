event_inherited();
button_objects = [
	["OK", scr_handle_options], //return to options menu
];
esc_callback = scr_handle_options;
event_user(2); // initialize menu