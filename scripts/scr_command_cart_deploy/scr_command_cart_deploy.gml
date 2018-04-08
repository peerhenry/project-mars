/// @arg cart
/// @arg x
/// @arg y
var arg_cart = argument0;
var arg_x = argument1;
var arg_y = argument2;

// var new_construction = scr_build_new();
var ghost = global.construction_ghost;
var valid = ghost[?macro_ghost_valid];
if(valid)
{
	var gx = scr_rc_clamp_center(arg_x);
	var gy = scr_rc_clamp_center(arg_y);
	arg_cart.deploy_ghost = instance_create_depth(gx, gy, 0, arg_cart.carrying_instance.object_index);
	arg_cart.action = cart_action.deploy;
	
	// navigate there
	var state = scr_navigate_to_assignable(arg_cart.deploy_ghost, arg_cart);
	if(state == reach_state.unreachable)
	{
		scr_alert_player("Cart cannot navigate there.");
		instance_destroy(arg_cart.deploy_ghost);
		arg_cart.deploy_ghost = noone;
		arg_cart.action = cart_action.idle;
		return false;
	}
	else if(state == reach_state.adjacent)
	{
		scr_end_path_action(arg_cart);
	}
}
return valid;