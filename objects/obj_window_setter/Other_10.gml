/// @description Set aa_level and vsync

if(debug_steps && !show_question("Set AA="+string(aa_level)+" and vsync="+string(vsync)+"?")) exit;
		
if(aa_level != 0)
{
	if((display_aa & aa_level) != display_aa) //requested aa level not supported by video device
	{
		scr_force_trace("Requested aa_level not supported, fallback to 0"); //todo: fallback to nearest lower supported aa level
		aa_level = 0;
	}
}
		
if(aa_level != global.window_aa_level || vsync != global.window_vsync) //needs update (warning: display_reset causes window to reset position to primary monitor)
{
	scr_trace("obj_window_setter: display_reset " + string(aa_level) + " " + string(vsync));
	display_reset(aa_level, vsync); //not too surprising that resetting the display comes first. Only necessary if you give players the option to change aa_level and vsync in game
	global.window_aa_level = aa_level;
	global.window_vsync = vsync;
}
else scr_trace("obj_window_setter: skipping display_reset with same values");