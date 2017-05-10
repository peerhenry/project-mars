var assignable = argument0;
var astronaut = argument1;
var arg_task = argument2;

var can_assign = false;
if(!assignable.is_assigned)
{
	switch(arg_task)
	{
		case task.suit_closet:
			var ass_i = scr_rc_to_gi(assignable.x);
			var ass_j = scr_rc_to_gi(assignable.y);

			var try_west = mp_grid_get_cell(scr_get_nav_grid(), ass_i-1, ass_j) == 0;
			var try_east = mp_grid_get_cell(scr_get_nav_grid(), ass_i+1, ass_j) == 0;
			var try_north = mp_grid_get_cell(scr_get_nav_grid(), ass_i, ass_j-1) == 0;
			var try_south = mp_grid_get_cell(scr_get_nav_grid(), ass_i, ass_j+1) == 0;
			
			if(try_west) can_assign = scr_navigate(astronaut, assignable.x-32, assignable.y);
			if(!can_assign && try_east) can_assign = scr_navigate(astronaut, assignable.x+32, assignable.y);
			if(!can_assign && try_north) can_assign = scr_navigate(astronaut, assignable.x, assignable.y-32);
			if(!can_assign && try_south) can_assign = scr_navigate(astronaut, assignable.x, assignable.y+32);
			break;
	}
}

if(can_assign)
{
	assignable.is_assigned = true;
	assignable.assigned_astronaut = astronaut;
	assignable.assigned_task = arg_task;
	
	astronaut.assigned_object = assignable;
}

return can_assign;