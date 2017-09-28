/// @arg astronaut
var arg_astronaut = argument0;

with(arg_astronaut)
{
	if(path_position > 0 && path_position < 1)
	{
		if(!is_walking) is_walking = true;
	}
	else if(is_walking && path_position == 1)
	{
		scr_stop_moving(id);
		path_end();
		scr_end_path_action(id);
	}
}