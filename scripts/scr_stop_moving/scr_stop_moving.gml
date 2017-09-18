/// @arg astronaut
var arg_astronaut = argument0;
debug_instance_inherits(arg_astronaut, obj_astronaut);
with(arg_astronaut)
{
	prev_x = x; // used for sprite orientation
	prev_y = y;
	is_walking = false;
	image_speed = 0;
	image_index = 0;
	path_end();
}