if(begin_landing_animation)
{
	begin_landing_animation = false;
	in(f_transit_modules, "land", id);
}
if(is_landing)
{
	if(path_position == 1)
	{
		in(f_transit_modules, "complete_landing", id);
	}
}
if(is_taking_off)
{
	if(path_position == 1)
	{
		in(f_transit_modules, "complete_takeoff", id);
	}
}
else event_inherited();