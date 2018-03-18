/// @arg astronaut
var robot = argument0;

// stop moving
if(path_exists(robot.path)) scr_stop_moving(robot);
scr_cancel_all(robot);

// todo: robot death sound

instance_destroy(robot);