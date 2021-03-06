/// @arg astro
var arg_astro = argument0;
var auto_eating = false;
with(arg_astro)
{
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
				var fridge_has_food = scr_inventory_has_item_type(inventory, inv_space.food);
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
			if(closest_fridge_with_food != noone)
			{
				auto_eating = true;
				scr_assign(closest_fridge_with_food, id);
			}
		}
	}
}
return auto_eating;