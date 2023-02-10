/// @param build
/// @param closet
function scr_closet_post_creation(argument0, argument1) {

	var arg_build = argument0;
	var arg_closet = argument1;

	with(arg_closet)
	{
		var rotation = image_angle div 90;
		image_index += rotation; // could be set in construction definition
		if(arg_build == macro_suit_closet_empty)
		{
			holds_suit = false;
		}
	}


}
