if(begin_landing_animation)
{
	image_index = 0;
	begin_landing_animation = false;
	
	if(!path_exists(path)) path = path_add();
	//mp_linear_path(path, basetile_target.x, basetile_target.y, worm_speed_underground, false); // does not go through solids
	y = y - 1080;
	path_add_point(path, x, y - 1080, 100);
	path_add_point(path, x, y, 10);
	path_set_closed(path, false); // so it doesnt go back
	var landing_speed = 30; // todo: move to config global
	path_start(path, landing_speed, path_action_stop, false);
}
if(is_landing)
{
	occ_j = scr_rc_to_gi(y);
	if(image_speed == 0 && path_position > 0.7) image_speed = 2; // at 70% of path, retract exhaust pipes
	if(image_speed > 0 && image_index >= (sprite_get_number(sprite_index) - 1) )
	{
		image_speed = 0; // stop animation when pipes have been retracted
	}
	if(path_position == 1)
	{
		// create base
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