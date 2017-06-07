/// @param consumer
var arg_consumer = argument0;

switch(arg_consumer.object_index)
{
	case obj_drill:
		if(arg_consumer.switched_on && arg_consumer.has_resource)
		{
			arg_consumer.image_speed = 1;
		}
		break;
}