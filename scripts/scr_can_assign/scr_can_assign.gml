/// @description Check if conditions for assignment are met
/// @param assignable
/// @param task_actor
var arg_assignable = argument0;
var arg_actor = argument1;

if(arg_assignable == noone || arg_assignable.owner != arg_actor.owner || arg_assignable.under_construction || arg_assignable.is_assigned) return false;

if(scr_instance_inherits(arg_assignable, obj_atm))
{
	if(!scr_instance_inherits(arg_actor, obj_astronaut)) return false;
	return ds_list_size(arg_assignable.embarked_astronauts) < arg_assignable.capacity;
}

switch(arg_assignable.object_index)
{
	case obj_suit_closet:
		if(!scr_instance_inherits(arg_actor, obj_astronaut)) return false;
		if(arg_actor.wears_suit == arg_assignable.holds_suit) return false;
		break;
	case obj_bed:
		return arg_assignable.occupant == noone; //!arg_actor.wears_suit;
	case obj_hydroponics:
		var hydroponics_has_food = scr_hydroponics_has_food(arg_assignable);
		var enough_space = scr_inventory_has_big_space(arg_actor.inventory);
		return enough_space && hydroponics_has_food;
	case obj_fridge:
		var astronaut_carries_food = scr_inventory_has_item_type(arg_actor.inventory, item_type.food);
		if(astronaut_carries_food) return scr_inventory_has_space_for_item_type(arg_assignable.inventory, item_type.food);
		else return scr_inventory_has_item_type(arg_assignable.inventory, item_type.food);
	case obj_mdu_pile:
		// astronaut has mdu and pile has less than 8
		if(scr_inventory_has_item_type(arg_actor.inventory, item_type.mdu))
		{
			return (arg_assignable.image_index < 7);
		}
		else
		{
			return true;
		}
}

return true;