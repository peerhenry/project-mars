var arg_astronaut = argument0;
with(arg_astronaut)
{
	assigned_object = noone
	current_action = astronaut_action.idle;
	construction = noone;
	if(is_walking) scr_stop_moving(arg_astronaut);
}