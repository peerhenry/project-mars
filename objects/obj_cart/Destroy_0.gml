/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(is_selected && deploy)
{
	global.cart_deploy_mode = false;
}

if(cart_action.deploy)
{
	instance_destroy(deploy_ghost);
	deploy_ghost = noone;
	current_action = cart_action.idle;
}