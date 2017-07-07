var arg_assignable = argument0;
var arg_astronaut = argument1;

var can_assign = false;
if(!arg_assignable.is_assigned)
{
	switch(arg_assignable.object_index)
	{
		case obj_suit_closet:
			if( arg_astronaut.wears_suit == arg_assignable.holds_suit || arg_assignable.under_construction ) return false;
			break;
		case obj_bed:
			if(arg_astronaut.wears_suit || arg_assignable.under_construction) return false;
			break;
	}
	
	var ass_i = scr_rc_to_gi(arg_assignable.x);
	var ass_j = scr_rc_to_gi(arg_assignable.y);
	var astro_i = scr_rc_to_gi(arg_astronaut.x);
	var astro_j = scr_rc_to_gi(arg_astronaut.y);
	var needs_to_navigate = true;
		
	var already_adjacent = (astro_i == ass_i && abs(astro_j - ass_j) == 1)
		|| (astro_j == ass_j && abs(astro_i - ass_i) == 1);
		
	if(already_adjacent)
	{
		can_assign = true; // no need to navigate
	}
	else // need to navigate
	{
		var try_west = scr_navgrid_cell_is_free(ass_i-1, ass_j);
		var try_east = scr_navgrid_cell_is_free(ass_i+1, ass_j);
		var try_north = scr_navgrid_cell_is_free(ass_i, ass_j-1);
		var try_south = scr_navgrid_cell_is_free(ass_i, ass_j+1);
			
		if(try_west) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x-32, arg_assignable.y);
		if(!can_assign && try_east) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x+32, arg_assignable.y);
		if(!can_assign && try_north) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x, arg_assignable.y-32);
		if(!can_assign && try_south) can_assign = scr_navigate_once(arg_astronaut, arg_assignable.x, arg_assignable.y+32);
	}
}

if(can_assign)
{
	arg_assignable.is_assigned = true;
	arg_assignable.assigned_astronaut = arg_astronaut;
	
	arg_astronaut.assigned_object = arg_assignable;
}

return can_assign;