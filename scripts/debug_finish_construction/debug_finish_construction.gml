var arg_construction_instance = argument0;

// check if there is a prerequisite
var prerequisite = arg_construction_instance[construction_prerequisite];
if(is_array(prerequisite))
{
	// finish the prerequisite
	if(prerequisite[construction_build_state] != construction_state.done)
	{
		debug_finish_construction(prerequisite);
	}
}

// complete construction
if(arg_construction_instance[construction_build_state] != construction_state.done)
{
	scr_build_complete(arg_construction_instance);
}