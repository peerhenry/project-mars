/// @param build
/// @param instance
function scr_post_creation_logic(argument0, argument1) {

	var arg_build = argument0;
	var arg_instance = argument1;

	switch(arg_instance.object_index)
	{
		case obj_suit_closet:
			scr_closet_post_creation(arg_build, arg_instance);
			break;
		case obj_destruct:
			scr_deconstruct_post_creation(arg_instance);
			break;
	}


}
