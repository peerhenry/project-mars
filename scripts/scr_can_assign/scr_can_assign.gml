/// @description Check if conditions for assignment are met
/// @param assignable
/// @param astronaut
var arg_assignable = argument0;
var arg_astronaut = argument1;

if(arg_assignable.owner != arg_astronaut.owner || arg_assignable.under_construction || arg_assignable.is_assigned) return false;

switch(arg_assignable.object_index)
{
	case obj_suit_closet:
		if( arg_astronaut.wears_suit == arg_assignable.holds_suit ) return false;
		break;
	case obj_bed:
		return arg_assignable.occupant == noone; //!arg_astronaut.wears_suit;
	case obj_hydroponics:
		// todo; write hydroponics assignment condition: 
		// hydroponics food must be done & astronaut must have space in inventory
		var hydroponics_has_food = scr_hydroponics_has_food(arg_assignable);
		var enough_space = scr_astronaut_has_big_space(arg_astronaut);
		return enough_space && hydroponics_has_food;
	case obj_fridge:
		var astronaut_carries_food = scr_astronaut_has(arg_astronaut, macro_inventory_food);
		if(astronaut_carries_food) return scr_inventory_has_space_for_item(arg_assignable.inventory, macro_inventory_food);
		else return scr_inventory_has_item(arg_assignable.inventory, macro_inventory_food);
	case obj_mdu_pile:
		// astronaut has mdu and pile has less than 8
		if(scr_astronaut_has(arg_astronaut, macro_inventory_module))
		{
			return (arg_assignable.image_index < 7);
		}
		else
		{
			return true;
		}
}

return true;