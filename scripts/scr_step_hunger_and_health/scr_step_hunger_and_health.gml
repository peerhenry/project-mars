/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(food_level == 0)
	{
		entity_health -= global.starvation_speed;
	}
	else
	{
		food_level -= global.hunger_speed;
		if(food_level < 0) food_level  = 0;
	}
	
	if(food_level < auto_eat_level && auto_eat)
	{
		// try to eat
		var can_eat = scr_eat(id);
		if(!can_eat)
		{
			// find fridge
			var closest_fridge_with_food = noone;
			var dts_min = 999999999;
			with(obj_fridge)
			{
				var fridge_has_food = scr_inventory_has_item(inventory, macro_inventory_food);
				if(fridge_has_food)
				{
					var di = occ_i - other.occ_i;
					var dj = occ_j - other.occ_j;
					var dts = di*di + dj*dj;
					if(dts < dts_min)
					{
						dts_min = dts;
						closest_fridge_with_food = id;
					}
				}
			}
			if(closest_fridge_with_food != noone) scr_assign(closest_fridge_with_food, id);
		}
	}
}