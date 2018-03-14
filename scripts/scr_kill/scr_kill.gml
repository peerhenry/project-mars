/// @param astronaut
var arg_entity = argument0;

switch(arg_entity.object_index)
{
	case obj_astronaut:
		scr_kill_astronaut(arg_entity);
		break;
	case obj_cart:
		break;
	case obj_robot:
		// todo: add robot kill events
		break;
}
