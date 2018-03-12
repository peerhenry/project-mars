/// @description Check if conditions for assignment are met
/// @param assignable
/// @param astronaut
var arg_assignable = argument0;
var arg_astronaut = argument1;

if(arg_assignable == noone || arg_assignable.owner != arg_astronaut.owner || arg_assignable.under_construction || arg_assignable.is_assigned) return false;

switch(arg_assignable.object_index)
{
	case obj_suit_closet:
		if( arg_astronaut.wears_suit == arg_assignable.holds_suit ) return false;
		break;
	case obj_bed:
		return arg_assignable.occupant == noone; //!arg_astronaut.wears_suit;
	case obj_hydroponics:
		var hydroponics_has_food = scr_hydroponics_has_food(arg_assignable);
		var enough_space = scr_inventory_has_big_space(arg_astronaut.inventory);
		return enough_space && hydroponics_has_food;
	case obj_fridge:
		var astronaut_carries_food = scr_inventory_has_item_type(arg_astronaut.inventory, inv_space.food);
		if(astronaut_carries_food) return scr_inventory_has_space_for_item_type(arg_assignable.inventory, inv_space.food);
		else return scr_inventory_has_item_type(arg_assignable.inventory, inv_space.food);
	case obj_mdu_pile:
		// astronaut has mdu and pile has less than 8
		if(scr_inventory_has_item_type(arg_astronaut.inventory, inv_space.mdu))
		{
			return (arg_assignable.image_index < 7);
		}
		else
		{
			return true;
		}
}

return true;