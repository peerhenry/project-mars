function scr_lr_with_construction() {
	// determine if deploying from cart
	var from_cart = false;
	var cart = noone;
	with(obj_cart)
	{
		if(is_selected)
		{
			from_cart = true;
			cart = id;
			break;
		}
	}

	// if not deploying, standard build new
	if(!from_cart)
	{
		scr_build_new();
		exit;
	}

	// else perform deploy
	if(!cart.deploy) show_error("scr_lr_with_construction with cart selected but not in deploy mode", true);
	var orders_given = scr_command_cart_deploy(cart, mouse_x, mouse_y);
	if(orders_given) resolve_execute(cart.script_container, "play_sound", sound_robot_confirm);
	// todo: else unable to execute sound


}
