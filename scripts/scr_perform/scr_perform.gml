var assignable = argument0;

switch(assignable.object_index)
{
	case obj_suit_closet:
		if(assignable.holds_suit) scr_closet_take_suit(assignable, assignable.assigned_astronaut);
		else scr_closet_put_suit(assignable, assignable.assigned_astronaut);
		assignable.assigned_astronaut.current_action = astronaut_action.idle;
		break;
}

scr_unassign_task(assignable);