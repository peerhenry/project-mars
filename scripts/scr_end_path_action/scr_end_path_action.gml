/// @arg astronaut
var arg_astronaut = argument0;
debug_instance_inherits(arg_astronaut, obj_astronaut);
scr_trace("Path end action!");

with(arg_astronaut)
{
	if(assigned_object != noone) // there is a task to perform at the end of the path.
	{
		scr_perform(assigned_object);
	}
	else
	{
		switch(current_action)
		{
			// If astronaut was moving to construction...
			case astronaut_action.moving_to_construction:
				current_action = astronaut_action.constructing;
				break;
			case astronaut_action.fetching_mdu:	// it's handled in scr_perform(assigned_object)
				
				break;
			case astronaut_action.delivering_mdu:
				scr_transfer_mdu(id, construction);
				if(scr_construction_is_ready(construction))
				{
					scr_update_astro_and_construction(id, construction, astronaut_action.constructing);
				}
				break;
			case astronaut_action.moving_by_command:
				current_action = astronaut_action.idle;
				break;
			case astronaut_action.moving_to_shoot:
				current_action = astronaut_action.in_combat;
				break;
			default:
				current_action = astronaut_action.idle;
				break;
		}
	}
}