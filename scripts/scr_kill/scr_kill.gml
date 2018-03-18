/// @param astronaut
var arg_entity = argument0;

switch(arg_entity.object_index)
{
	case obj_astronaut:
		scr_kill_astronaut(arg_entity);
		break;
	case obj_cart:
	case obj_robot:
		scr_kill_robot(arg_entity);
		break;
}
