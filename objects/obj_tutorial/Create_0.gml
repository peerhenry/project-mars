step = -1;
has_initialized = false;

astronaut = noone;
closet = noone;
arrow = noone;
// Initialize after five steps
alarm[0] = 5;

instance_create_depth(-1000,-1000, 0, obj_wasd);