/// @arg component
var arg_component = argument0;
var cart_can_carry = false;
switch(arg_component.object_index)
{
	case obj_oxygen_tank:
	case obj_suit_closet:
	case obj_electrolyser:
	case obj_fridge:
	case obj_hydroponics:
	case obj_pump:
		cart_can_carry = true;
		break;
}
return cart_can_carry && !arg_component.under_construction;