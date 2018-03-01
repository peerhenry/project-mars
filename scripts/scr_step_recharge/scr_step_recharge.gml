/// @arg x
/// @arg y
var check_x = argument0;
var check_y = argument1;

var north_instance = noone;
north_instance = instance_position(check_x, check_y, obj_robot);
if(north_instance == noone) north_instance = instance_position(check_x, check_y, obj_cart);
if(north_instance != noone)
{
	if(north_instance.owner == owner)
	{
		with(north_instance)
		{
			if(battery_charge < 100)
			{
				battery_charge += 0.1;
				if(battery_charge > 100) battery_charge = 100;
			}
		}
	}
}
else north_instance = instance_position(check_x, check_y, obj_astronaut);

if(north_instance != noone)
{
	if(north_instance.owner == owner)
	{
		// todo: recharge weapons
	}
}