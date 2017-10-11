/// @arg astronaut
var arg_astronaut = argument0;
with(arg_astronaut)
{
	if(assigned_object != noone && assigned_object.object_index == obj_mdu_pile)
	{
		scr_unassign_task(assigned_object);
	}
	assigned_object = noone;
	current_action = astronaut_action.idle;
	construction = noone;
	if(is_walking) scr_cancel_walking(arg_astronaut);
}