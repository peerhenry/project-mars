/// @arg entity
function scr_step_path(argument0) {

	var arg_entity = argument0;

	with(arg_entity)
	{
		if(path_exists(path))
		{
			if(path_position > 0.95)
			{
				var end_x = scr_gi_to_rc(dest_i);
				var end_y = scr_gi_to_rc(dest_j);
				var dx = abs(end_x - x);
				var dy = abs(end_y - y);
				if(dx < 2 && dy < 2)
				{
					scr_stop_moving(id);
					scr_end_path_action(id);
				}
			}
		}
	
		if(object_index == obj_robot || object_index == obj_cart)
		{
			if( battery_charge == 0 )
			{
				speed = 0;
			}
		}
	}


}
