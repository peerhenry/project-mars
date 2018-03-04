/// @arg entity

var arg_entity = argument0;

with(arg_entity)
{
	if(path_exists(path))
	{
		if(path_position == 1)
		{
			scr_stop_moving(id);
			scr_end_path_action(id);
		}
	}
	
	if(object_index == obj_robot || object_index == obj_cart)
	{
		if(battery_charge == 0)
		{
			speed = 0;
		}
	}
}