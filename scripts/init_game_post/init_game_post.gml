function init_game_post() {
	scr_trace("Calling init_game_post");

	with(obj_constructable)
	{
		event_user(macro_post_init);
	}

	// Finalize, foundation first
	with(obj_base_tile)
	{
		if(under_construction) event_user(macro_event_finalize);
	}
	with(obj_wall)
	{
		if(under_construction) event_user(macro_event_finalize);
	}

	with(obj_base_component)
	{
		if(under_construction) event_user(macro_event_finalize);
	}

	// starting rooms have 100% oxygen
	with(obj_room)
	{
		oxygen_level = 100;
	}


}
