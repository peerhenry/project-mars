step = -2;
has_initialized = false;

astronaut = noone;
closet = noone;
arrow = noone;
tutorial_complete = false;
// Initialize after five steps
alarm[0] = 5;

init_tutorial();
instance_create_depth(-1000,-1000, 0, obj_wasd);
script_container = global.script_container;
alert_script = script_container_resolve(script_container, "alert_player");