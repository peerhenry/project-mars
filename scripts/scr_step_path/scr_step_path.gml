/// @arg astronaut
var script_container = argument0;
var arg_astronaut = argument1;

with(arg_astronaut)
{
	if(path_position > 0 && path_position < 1)
	{
		if(!is_moving) is_moving = true;
	}
	else if(is_moving && path_position == 1)
	{
		scr_stop_moving(id);
		path_end();
		scr_end_path_action(id);
	}
}