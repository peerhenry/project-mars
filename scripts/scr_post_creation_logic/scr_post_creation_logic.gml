var arg_build = argument0;
var arg_instance = argument1;

if(arg_build == global.door || arg_build == global.hatch)
{
	with(arg_instance){
		image_angle = global.build_rotation*90;
	}
}
else if(arg_build == global.suit_closet_empty || arg_build == global.suit_closet_empty)
{
	with(arg_instance){
		image_index = global.build_rotation;
	}
	
	if(arg_build == global.suit_closet_empty)
	{
		with(arg_instance){
			holds_suit = false;
			image_index += 4;
		}
	}
}