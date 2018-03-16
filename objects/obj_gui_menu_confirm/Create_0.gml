event_inherited();
confirm_text = "Confirm";
/*confirm_state = noone;
yes_callback = noone;*/
if(y == noone) y = scr_discard_confirm;
no_callback = y;
button_objects = [
	["Yes", x],
	["No", y]
];
event_user(2); // initialize menu