/// @description This script performs the interaction the astronaut will have with the assignable.
/// @param assignable
var arg_assignable = argument0;
var assigned_astronaut = arg_assignable.assigned_astronaut;

// refactor option: use a custom object event
switch(arg_assignable.object_index)
{
	case obj_suit_closet:
		if(arg_assignable.holds_suit) scr_closet_take_suit(arg_assignable, assigned_astronaut);
		else scr_closet_put_suit(arg_assignable, assigned_astronaut);
		assigned_astronaut.current_action = astronaut_action.idle;
		break;
	case obj_bed:
		arg_assignable.occupant = assigned_astronaut;
		arg_assignable.image_index++;
		assigned_astronaut.current_action = astronaut_action.idle;
		instance_deactivate_object(assigned_astronaut);
		break;
	case obj_fridge:
		// todo: write astronaut interaction with fridge
		break;
	case obj_hydroponics:
		// todo: write astronaut interaction with hydroponics
		break;
}

scr_unassign_task(arg_assignable);