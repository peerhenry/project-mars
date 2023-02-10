/// @arg astronaut
function scr_kill_robot(argument0) {
	var robot = argument0;

	// stop moving
	if(path_exists(robot.path)) scr_stop_moving(robot);
	scr_cancel_all(robot);

	resolve_execute(robot.script_container, "play_sound", sound_fx_robot_down);

	instance_destroy(robot);


}
