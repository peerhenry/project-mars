/// @description toggle deploy

deploy = !deploy;

if(carrying_instance != noone && deploy)
{
	var constr_type = scr_get_construction_type(carrying_instance);
	scr_ghost_reset_with_constr_type(constr_type);
}
else
{
	scr_ghost_reset_with_constr_type(noone);
}