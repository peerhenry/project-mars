/// @description destroy 

event_inherited();
if(carrying_instance != noone && instance_exists(carrying_instance))
{
	instance_destroy(carrying_instance);
	carrying_instance = noone;
}

if(deploy_ghost != noone && instance_exists(deploy_ghost))
{
	instance_destroy(deploy_ghost);
	deploy_ghost = noone;
}

current_action = cart_action.idle;