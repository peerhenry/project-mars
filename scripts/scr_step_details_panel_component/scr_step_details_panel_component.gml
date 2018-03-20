/// @description sets hover and unit prop_value
var arg_component = argument0;

var wmx = window_mouse_get_x();
var wmy = window_mouse_get_y();

with(arg_component)
{
	// update unit property
	prop_value = 0;
	switch(unit_property)
	{
		case unit_prop.health_integrity:
			if(scr_instance_inherits(unit, obj_movable)) prop_value = unit.entity_health;
			else if(scr_instance_inherits(unit, obj_constructable)) prop_value = 100 - unit.damage;
			break;
		case unit_prop.sleep:
			prop_value = unit.sleep_level;
			break;
		case unit_prop.food:
			prop_value = unit.food_level;
			break;
		case unit_prop.battery_charge:
			prop_value = unit.battery_charge;
			break;
		case unit_prop.suit_oxygen:
			prop_value = unit.suit_oxygen;
			break;
	}
	
	hover = 
		wmx >= left
		&& wmx <= right
		&& wmy >= top
		&& wmy <= bottom;
	
	if(hover && mouse_check_button_pressed(mb_left))
	{
		with(obj_HUD_details_panel)
		{
			scr_execute_details_panel_action(arg_component, id, other.action);
		}
	}
}