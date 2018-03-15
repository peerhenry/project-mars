event_inherited();
confirm_text = "Confirm";
confirm_state = noone;
yes_callback = noone;
no_callback = noone;
button_objects = [
	obj_gui_menu_button_confirm_yes,
	obj_gui_menu_button_confirm_no
];
event_user(2); // initialize menu