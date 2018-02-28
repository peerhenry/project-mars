/// @arg entity

var arg_entity = argument0;

with(arg_entity)
{
	if(path_exists(path))
	{
		if(is_moving) // todo: refactor is_moving to path_exists
		{
			if(path_position == 1)
			{
				scr_stop_moving(id);
				scr_end_path_action(id);
				//path_delete(path); // todo: refactor is_moving to path_exists
			}
		}
		else if(path_position > 0 && path_position < 1)
		{
			is_moving = true;
		}
	}
}