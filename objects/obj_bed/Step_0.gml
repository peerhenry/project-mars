/// @description Update sleeping astronaut

if(occupant != noone)
{
	occupant.sleep_level += sleep_speed;
	if(occupant.sleep_level > 100)
	{
		with(occupant)
		{
			sleep_level = 100;
		}
		// var spot = scr_find_free_spot_around(id);
		//in(f_astro_disappear, "disappear", occupant);
		uvoid(id, "eject");
	}
}