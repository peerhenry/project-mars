/// @description Check for trailing instances


var expected_instances = 2; //obj_tests and obj_persistent_listener
if(instance_count > expected_instances)
{
	show_error("There are " + string(instance_count - expected_instances) + " trailing instances after tests.", true);
}