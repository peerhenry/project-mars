var arg_build = argument0;
var arg_instance = argument1;

if(arg_build == build.door || arg_build == build.hatch)
{
	with(arg_instance){
		image_angle = global.build_rotation*90;
	}
}
else if(arg_build == build.suit_closet || arg_build == build.suit_closet_empty)
{
	with(arg_instance){
		image_index = global.build_rotation;
	}
	
	if(arg_build == build.suit_closet_empty)
	{
		with(arg_instance){
			holds_suit = false;
			image_index += 4;
		}
	}
}