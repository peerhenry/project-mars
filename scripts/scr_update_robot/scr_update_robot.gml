/// @arg cart_or_robot
with(argument0)
{
	if(battery_charge > 0)
	{
		battery_charge -= 0.01;
		if(is_moving) battery_charge -= 0.01;
		
		if(battery_charge < 0) battery_charge = 0;
	}
}