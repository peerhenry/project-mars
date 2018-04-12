if(begin_landing_animation)
{
	begin_landing_animation = false;
	in(f_transit_modules, "land", id);
	is_landing = true;
}
if(is_landing)
{
	occ_j = scr_rc_to_gi(y);
	if(image_speed == 0 && path_position > 0.7)
	{
		in(f_transit_modules, "disengage_thrusters", id);
	}
	if(image_speed > 0 && image_index >= (sprite_get_number(sprite_index) - 1) )
	{
		image_speed = 0; // stop animation when pipes have been retracted
	}
	if(path_position == 1)
	{
		is_landing = false;
		path_delete(path);
		
		for(var i = -2; i <= 2; i++)
		{
			for(var j = -2; j <= 2; j++)
			{
				scr_navgrid_free(occ_i + i, occ_j + j);
			}
		}
		
		scr_setup_room(occ_i - 1, occ_j - 2, 3, 3);
		
		instance_destroy();
	}
}