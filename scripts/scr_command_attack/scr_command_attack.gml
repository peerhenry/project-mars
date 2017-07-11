/// @param arg_enemy
var arg_enemy = argument0;

with(obj_astronaut_playable)
{
	if(is_selected)
	{
		// cancel construction
		if(current_action = astronaut_action.constructing || current_action = astronaut_action.moving_to_construction)
		{
			construction_instance[@construction_build_state] = construction_state.ready;
		}
		current_action = astronaut_action.executing_assignment;
	
		current_action = astronaut_action.move_to_attack;
		target = arg_enemy;
		scr_navigate(id, arg_enemy.x, arg_enemy.y);
	}
}