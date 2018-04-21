var arg_assignable = argument0;
var orders_given = false;

// From all selected astronauts, pick the one closest to the assignable
var d_min = 100000000;
var assigned_actor = noone;
with(obj_task_actor)
{
	if(is_selected)
	{
		var ds = scr_d_squared(id, arg_assignable);
		var can_assign = scr_can_assign(arg_assignable, id);
		if(ds < d_min && can_assign){
			d_min = ds;
			assigned_actor = id; // TODO: allow multi assign (mdu pile/ATM)
			break;
		}
	}
}

// Use the one astronaut to assign the assignable.
if(assigned_actor != noone)
{
	orders_given = scr_assign(arg_assignable, assigned_actor); // todo: set end path action
	
	if(scr_instance_inherits(arg_assignable, obj_atm))
	{
		assigned_actor.end_path_action = new(arg_assignable.interaction, assigned_actor, arg_assignable);
	}
	
	// Cancel construction
	if(orders_given)
	{
		with(assigned_actor)
		{
			if(current_action = astronaut_action.constructing || current_action = astronaut_action.moving_to_construction)
			{
				ds_map_replace(construction, construction_build_state, construction_state.ready);
			}
			current_action = astronaut_action.executing_assignment;
		}
	}
}

// If assignment succesful, all other selected movables should just move there
if(orders_given)
{
	with(obj_movable)
	{
		if(is_selected && id != assigned_actor)
		{
			 scr_command_move_to(id, arg_assignable.x, arg_assignable.y);
		}
	}
}

return orders_given;