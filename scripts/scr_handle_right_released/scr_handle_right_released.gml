var constr_type = scr_get_selected_constr_type();
if(constr_type != noone)
{
	scr_ghost_reset();
	with(obj_cart)
	{
		deploy = false;
	}
}
else scr_command(mouse_x, mouse_y);