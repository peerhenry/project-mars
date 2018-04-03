/// @description Update sleeping astronaut

if(occupant != noone)
{
	occupant.sleep_level += sleep_speed;
	if(occupant.sleep_level > 100)
	{
		var spot = scr_find_free_spot_around(id);
		with(occupant)
		{
			sleep_level = 100;
			script_update = scr_astro_update;
			visible = true;
			x = scr_ij_to_x(spot);
			y = scr_ij_to_y(spot);
		}
		occupant = noone;
		image_index++;
	}
}