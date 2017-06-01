var arg_astronaut = argument0;
with(arg_astronaut)
{
	current_action = astronaut_action.idle;
	construction = 0;
	if(is_walking) scr_stop_moving(arg_astronaut);
}