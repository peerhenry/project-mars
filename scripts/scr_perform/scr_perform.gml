var assignable = argument0;

switch(assignable.object_index)
{
	case obj_suit_closet:
		if(assignable.holds_suit) scr_closet_take_suit(assignable, assignable.assigned_astronaut);
		else scr_closet_put_suit(assignable, assignable.assigned_astronaut);
		break;
}

scr_unassign_task(assignable);