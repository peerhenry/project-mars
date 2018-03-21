/// @arg healthbar
var arg_healthbar = argument0;

with(arg_healthbar)
{
	switch(bar_prop)
	{
		case unit_prop.entity_health:
			bar_amount = unit.entity_health;
			bar_color = c_lime;
			if(bar_amount < 50) bar_color = c_yellow;
			if(bar_amount < 20) bar_color = c_red;
			break;
		case unit_prop.integrity:
			bar_amount = 100 - unit.damage;
			bar_color = c_lime;
			if(bar_amount < 50) bar_color = c_yellow;
			if(bar_amount < 20) bar_color = c_red;
			break;
		case unit_prop.battery_charge:
			bar_amount = unit.battery_charge;
			break;
		case unit_prop.sleep:
			bar_amount = unit.sleep_level;
			break;
		case unit_prop.food:
			bar_amount = unit.food_level;
			break;
		case unit_prop.suit_oxygen:
			bar_amount = 100;
			if(unit.wears_suit) bar_amount = unit.suit_oxygen_level;
			break;
	}
}