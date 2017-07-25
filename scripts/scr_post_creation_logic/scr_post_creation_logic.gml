/// @param build
/// @param instance

var arg_build = argument0;
var arg_instance = argument1;

if(arg_instance.object_index == obj_suit_closet)
{
	with(arg_instance)
	{
		var rotation = image_angle div 90;
		//image_angle = 0;
		image_index += rotation; // can be set in construction definition
		
		// not sure how this can be refactored...
		if(arg_build == macro_suit_closet_empty)
		{
			holds_suit = false;
		}
	}
}