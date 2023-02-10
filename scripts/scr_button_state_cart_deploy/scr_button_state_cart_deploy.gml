/// @arg button
function scr_button_state_cart_deploy(argument0) {
	var arg_button = argument0;

	var active = false;
	with(arg_button.cart)
	{
		active = deploy;
	}
	return active;


}
