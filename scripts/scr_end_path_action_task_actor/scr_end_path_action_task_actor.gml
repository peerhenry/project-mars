/// @descr performs and updates the current action
/// @arg task_actor
var arg_entity = argument0;
debug_instance_inherits(arg_entity, obj_task_actor);

with(arg_entity)
{	
	switch(current_action)
	{
		case astronaut_action.moving_to_construction:
			current_action = astronaut_action.constructing;
			scr_set_pistol_sprite(arg_entity, move_dir, true);
			break;
		case astronaut_action.fetching_mdu:
			scr_deliver_mdu_after_fetch(id);
			break;
		case astronaut_action.delivering_mdu:
			scr_transfer_mdu(script_container, id, construction);
			if(scr_construction_is_ready(construction))
			{
				scr_update_astro_and_construction(id, construction, astronaut_action.constructing);
			}
			break;
		case astronaut_action.moving_by_command:
			current_action = astronaut_action.idle;
			autotasking = false;
			break;
		case astronaut_action.moving_to_shoot:
			current_action = astronaut_action.in_combat;
			break;
		default:
			current_action = astronaut_action.idle;
			autotasking = false;
			break;
	}
}