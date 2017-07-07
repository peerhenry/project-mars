var arg_assignable = argument0;

switch(arg_assignable.object_index)
{
	case obj_suit_closet:
		if(arg_assignable.holds_suit) scr_closet_take_suit(arg_assignable, arg_assignable.assigned_astronaut);
		else scr_closet_put_suit(arg_assignable, arg_assignable.assigned_astronaut);
		arg_assignable.assigned_astronaut.current_action = astronaut_action.idle;
		break;
	case obj_bed:
		arg_assignable.occupant = arg_assignable.assigned_astronaut;
		arg_assignable.image_index++;
		arg_assignable.assigned_astronaut.current_action = astronaut_action.idle;
		instance_deactivate_object(arg_assignable.assigned_astronaut);
		break;
		
}

scr_unassign_task(arg_assignable);