/// @description Check for trailing instances

var count = scr_count_instances(obj_assign_icon);

var item_count = instance_number(obj_item);
if(item_count > 0) show_message("item count: " + string(item_count));

if(instance_count > 1)
{
	show_error("There are " + string(instance_count - 1) + " trailing instances after tests.", true);
}