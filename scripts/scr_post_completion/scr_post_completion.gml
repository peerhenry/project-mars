function scr_post_completion(argument0) {
	var arg_instance = argument0;

	with(arg_instance)
	{
		switch(object_index)
		{
			case obj_pipe:
				depth -= 1; // pipes should appear on top of cables
				break;
			default:
				break;
		}
	}


}
