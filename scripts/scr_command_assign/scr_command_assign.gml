var arg_assignable = argument0;
var orders_given = false;

// From all selected astronauts, pick the one closest to the assignable
var d_min = 100000000;
var assigned_astronaut = noone;
with(obj_astronaut_playable)
{
	if(is_selected)
	{
		var ds = scr_d_squared(id, arg_assignable);
		var can_assign = scr_can_assign(arg_assignable, id);
		if(ds < d_min && can_assign){
			d_min = ds;
			assigned_astronaut = id;
			break;
		}
	}
}

// Use the one astronaut to assign the assignable.
if(assigned_astronaut != noone)
{
	orders_given = scr_assign(arg_assignable, assigned_astronaut);
	// Cancel construction
	if(orders_given)
	{
		with(assigned_astronaut)
		{
			if(current_action = astronaut_action.constructing || current_action = astronaut_action.moving_to_construction)
			{
				ds_map_replace(construction, construction_build_state, construction_state.ready);
			}
			current_action = astronaut_action.executing_assignment;
		}
	}
}

return orders_given;