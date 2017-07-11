var orders_given = false;
with(obj_astronaut_playable)
{
	if(is_selected){
		var will_go = scr_navigate(id, mouse_x, mouse_y);
		if(will_go)
		{
			if(current_action = astronaut_action.constructing || current_action = astronaut_action.moving_to_construction)
			{
				construction_instance[@construction_build_state] = construction_state.ready;
			}
			current_action = astronaut_action.moving_by_command;
			orders_given = true;
		}
	}
}

return orders_given;