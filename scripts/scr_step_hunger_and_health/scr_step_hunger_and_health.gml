/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(food_level == 0)
	{
		astronaut_health -= 0.02;
	}
	else
	{
		food_level -= 0.1;
		if(food_level < 0) food_level  = 0;
	}
	
	if(food_level < 20 && auto_eat)
	{
		// try to eat
		var has_food = scr_inventory_has_item(inventory, macro_inventory_food);
		if(has_food)
		{
			scr_inventory_extract(inventory, macro_inventory_food);
			food_level = 100;
		}
		else
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
			scr_assign(closest_fridge_with_food, id);
		}
	}
}