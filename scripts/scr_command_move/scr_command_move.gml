/// @arg arg_x
/// @arg arg_y
var arg_x = argument0;
var arg_y = argument1;

var orders_given = false;
with(obj_astronaut_playable)
{
	if(is_selected)
	{
		 var will_go = scr_command_move_to(id, arg_x, arg_y);
		 if(will_go) orders_given = true;
	}
}

return orders_given;