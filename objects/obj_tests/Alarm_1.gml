/// @description Check for trailing instances

var count = scr_count_instances(obj_assign_icon); //todo: remove this?

var item_count = instance_number(obj_item);
if(item_count > 0) show_message("item count: " + string(item_count));

var expected_instances = 2; //obj_tests and obj_persistent_listener

if(instance_count > expected_instances)
{
	show_error("There are " + string(instance_count - expected_instances) + " trailing instances after tests.", true);
}