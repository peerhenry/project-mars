/// @description Check for trailing instances

var count = scr_count_instances(obj_assign_icon);
show_debug_message("EYO: there were " + string(count) + " obj_assign_icon");

if(instance_count > 1)
{
	show_error("There are " + string(instance_count - 1) + " trailing instances after tests.", true);
}