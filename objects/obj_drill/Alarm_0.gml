/// @description mine metal

if(!under_construction && resource_instance > 0 && scr_can_draw_power(id))
{
	if(resource_instance.amount > 20)
	{
		resource_instance.amount -= 20;
		global.resource_amount_metal += 20;
	}
	else
	{
		var d_metal = resource_instance.amount;
		resource_instance.amount -= d_metal;
		global.resource_amount_metal += d_metal;
		instance_destroy(resource_instance);
		resource_instance = noone;
		has_resource = false;
	}
}

if(resource_instance.amount > 0)
{
	alarm_set(macro_alarm_mine_metal, 30);
}