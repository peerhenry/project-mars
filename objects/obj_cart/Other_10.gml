/// @description toggle deploy

deploy = !deploy;

if(carrying_instance != noone && deploy)
{
	var c_type = scr_get_construction_type(carrying_instance);
	scr_ghost_reset_with_constr_type(c_type);
	global.cart_deploy_mode = true;
}
else
{
	scr_ghost_reset_with_constr_type(noone);
	global.cart_deploy_mode = false;
}