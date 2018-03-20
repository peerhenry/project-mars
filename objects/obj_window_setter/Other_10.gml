/// @description Set aa_level and vsync

if(debug_steps && !show_question("Set AA="+string(aa_level)+" and vsync="+string(vsync)+"?")) exit;

//validate aa level is supported by video device
if(aa_level < 0)
{
	aa_level = 0;
	scr_force_trace("Requested aa_level not supported, fallback to 0");
}
else if((display_aa & aa_level) != aa_level)
{
	while((display_aa & aa_level) != aa_level) aa_level--; //fallback to nearest lower supported aa level
	scr_force_trace("Requested aa_level not supported, fallback to " + string(aa_level));
}

//update if changed
if(aa_level != global.window_aa_level || vsync != global.window_vsync)
{
	scr_trace("obj_window_setter: display_reset " + string(aa_level) + " " + string(vsync));
	display_reset(aa_level, vsync); //warning: display_reset causes window to reset position to primary monitor
	//todo: after repositioning to primary monitor, set window_x and y again?
	global.window_aa_level = aa_level;
	global.window_vsync = vsync;
}
else scr_trace("obj_window_setter: skipping display_reset with same values");