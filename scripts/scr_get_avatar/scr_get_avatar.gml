/// @arg unit
var arg_unit = argument0;

var sprite = spr_avatar;
if(scr_instance_inherits(arg_unit, obj_constructable)) sprite = arg_unit.sprite_index;
else switch(arg_unit.object_index)
{
	case obj_drill:
		// todo: make shorter avatar
		break;
	case obj_cart:
		sprite = arg_unit.sprite_index;
		break;
	case obj_robot:
		sprite = arg_unit.sprite_index;
		break;
}

return sprite;