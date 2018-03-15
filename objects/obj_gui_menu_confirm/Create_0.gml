event_inherited();
confirm_text = "Confirm";
confirm_state = noone;
yes_callback = noone;
no_callback = noone;
button_objects = [
	["Yes", scr_handle_confirm_yes],
	["No", scr_handle_confirm_no]
];
event_user(2); // initialize menu