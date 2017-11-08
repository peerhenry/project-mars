/// @description Check for trailing instances
if(instance_count > 1)
{
	show_error("There are " + string(instance_count - 1) + " trailing instances after tests.", true);
}