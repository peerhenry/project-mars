/// @arg arg_x
/// @arg arg_y
function scr_command_move(argument0, argument1) {
	var arg_x = argument0;
	var arg_y = argument1;

	var orders_given = false;
	with(obj_movable)
	{
		if(is_selected)
		{
			 var will_go = scr_command_move_to(id, arg_x, arg_y);
			 if(will_go) orders_given = true;
		}
	}

	return orders_given;


}
