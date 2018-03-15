event_inherited();

if(is_active)
{
	//reset states for new confirm dialog
	confirm_text = "Confirm";
	confirm_state = noone;
	yes_callback = noone;
	no_callback = noone;
}