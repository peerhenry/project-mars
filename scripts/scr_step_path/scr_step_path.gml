/// @arg astronaut
var script_container = argument0;
var arg_astronaut = argument1;

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
		scr_end_path_action(script_container, id);
	}
}