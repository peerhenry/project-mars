/// @arg astro
/// @arg x
/// @arg y
function scr_command_move_to(argument0, argument1, argument2) {
	var arg_entity = argument0;
	var arg_x = argument1;
	var arg_y = argument2;

	var orders_given = false;
	var will_go = scr_navigate(arg_entity, arg_x, arg_y);
	if(will_go)
	{
		if(object_is_ancestor(arg_entity.object_index, obj_task_actor))
		{
			arg_entity.current_action = astronaut_action.moving_by_command;
		}
		else if(scr_instance_inherits(arg_entity, obj_cart))
		{
			arg_entity.action = cart_action.move;
		}
		orders_given = true;
	}

	return orders_given;


}
