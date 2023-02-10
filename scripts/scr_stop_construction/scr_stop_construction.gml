/// @arg astronaut
function scr_stop_construction(argument0) {
	var arg_astronaut = argument0;

	with(arg_astronaut)
	{
		if(assigned_object != noone)
		{
			scr_unassign_task(assigned_object);
		}
		assigned_object = noone;
		current_action = astronaut_action.idle;
		construction = noone;
		if(path_exists(path)) scr_cancel_walking(arg_astronaut);
		if(construction_sound != noone) audio_stop_sound(construction_sound);
	}


}
