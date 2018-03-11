var arg_instance = argument0;
var c_type = noone;

switch(arg_instance.object_index)
{
	case obj_fridge:
		c_type = macro_fridge;
		break;
	case obj_solar_panel:
		c_type = macro_solar_panel;
		break;
	case obj_oxygen_tank:
		c_type = macro_oxygen_tank;
		break;
	case obj_suit_closet:
		c_type = macro_suit_closet;
		break;
	case obj_hydroponics:
		c_type = macro_hydroponics;
		break;
	case obj_electrolyser:
		c_type = macro_electrolyser;
		break;
	case obj_pump:
		c_type = macro_pump;
		break;
	case obj_battery:
		c_type = macro_battery;
		break;
	case obj_recharge_station:
		c_type = macro_recharge_station;
		break;
}

return c_type;