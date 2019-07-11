/// @arg x
/// @arg y
var check_x = argument0;
var check_y = argument1;

var instance = noone;
instance = instance_position(check_x, check_y, obj_robot);
if(instance == noone) instance = instance_position(check_x, check_y, obj_cart);

// recharge robot/cart battery
if(instance != noone)
{
	if(instance.owner == owner)
	{
		with(instance)
		{
			if(battery_charge < 100)
			{
				battery_charge += 0.1;
				if(battery_charge > 100) battery_charge = 100;
			}
		}
	}
}
else instance = instance_position(check_x, check_y, obj_astronaut);

// recharge inventory
if(instance != noone && scr_instance_inherits(instance, obj_task_actor))
{
	with(instance)
	{
		if(owner == macro_player)
		{
			if(
				equipped_item != noone 
				&& (equipped_item.type == item_type.pistol || equipped_item.type == item_type.rifle))
				&& equipped_item.charge < 100
			{
				equipped_item.charge += 0.1;
				if(equipped_item.charge > 100) equipped_item.charge = 100;
			}
		}
	}
}