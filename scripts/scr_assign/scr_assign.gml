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
			var astro_i = scr_rc_to_gi(astronaut.x);
			var astro_j = scr_rc_to_gi(astronaut.y);
			var needs_to_navigate = true;
			
			if(
				(astro_i == ass_i && abs(astro_j - ass_j) == 1)
				|| (astro_j == ass_j && abs(astro_i - ass_i) == 1)
			){
				can_assign = true; // no need to navigate
			}
			else { // need to navigate
				var try_west = scr_navgrid_cell_is_free(ass_i-1, ass_j);
				var try_east = scr_navgrid_cell_is_free(ass_i+1, ass_j);
				var try_north = scr_navgrid_cell_is_free(ass_i, ass_j-1);
				var try_south = scr_navgrid_cell_is_free(ass_i, ass_j+1);
			
				if(try_west) can_assign = scr_navigate_once(astronaut, assignable.x-32, assignable.y);
				if(!can_assign && try_east) can_assign = scr_navigate_once(astronaut, assignable.x+32, assignable.y);
				if(!can_assign && try_north) can_assign = scr_navigate_once(astronaut, assignable.x, assignable.y-32);
				if(!can_assign && try_south) can_assign = scr_navigate_once(astronaut, assignable.x, assignable.y+32);
			}
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