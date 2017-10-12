scr_trace("Calling init_game_post");

// First finalize foundation
with(obj_base_tile)
{
	event_user(macro_event_finalize);
}
with(obj_wall)
{
	event_user(macro_event_finalize);
}

// Then others
with(obj_base_component)
{
	event_user(macro_event_finalize);
}

// starting rooms have 100% oxygen
with(obj_room)
{
	oxygen_level = 100;
}

global.init_stage = false;