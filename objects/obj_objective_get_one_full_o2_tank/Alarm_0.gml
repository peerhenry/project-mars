with(obj_oxygen_tank)
{
	if(scr_get_grid_prop(id, macro_grid_oxygen, macro_grid_prop_value) > 99)
	{
		other.accomplished = true;
	}
}
alarm[0] = 60;