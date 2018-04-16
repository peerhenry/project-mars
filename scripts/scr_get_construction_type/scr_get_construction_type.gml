var arg_instance = argument0;
var constr_type = noone;

switch(arg_instance.object_index)
{
	case obj_fridge:
		constr_type = macro_fridge;
		break;
	case obj_solar_panel:
		constr_type = macro_solar_panel;
		break;
	case obj_oxygen_tank:
		constr_type = macro_oxygen_tank;
		break;
	case obj_suit_closet:
		constr_type = macro_suit_closet;
		break;
	case obj_hydroponics:
		constr_type = macro_hydroponics;
		break;
	case obj_electrolyser:
		constr_type = macro_electrolyser;
		break;
	case obj_pump:
		constr_type = macro_pump;
		break;
	case obj_battery:
		constr_type = macro_battery;
		break;
	case obj_recharge_station:
		constr_type = macro_recharge_station;
		break;
}

return constr_type;