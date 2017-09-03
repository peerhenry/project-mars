/// @arg astronaut
debug_instance_inherits(argument0, obj_astronaut);
var arg_astronaut = argument0;

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
			case astronaut_action.delivering_mdu:
				scr_deliver_mdu(id, construction);
				if(scr_construction_is_ready(construction))
				{
					scr_pick_up_construction(id, construction, astronaut_action.constructing)
				}
				break;
			case astronaut_action.moving_by_command:
				current_action = astronaut_action.idle;
				break;
		}
	}
}