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
		}
		in(f_astro_disappear, "disappear", occupant);
		occupant = noone;
		image_index++;
	}
}