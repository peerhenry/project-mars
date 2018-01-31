scr_trace("Calling init_game_post");

// First finalize foundation
with(obj_base_tile)
{
	if(under_construction) event_user(macro_event_finalize);
}
with(obj_wall)
{
	if(under_construction) event_user(macro_event_finalize);
}

// Then others
with(obj_base_component)
{
	if(under_construction) event_user(macro_event_finalize);
}

// starting rooms have 100% oxygen
with(obj_room)
{
	oxygen_level = 100;
}

with(obj_pump)
{
	scr_connect_to_pipes(id);
	scr_connect_to_cables(id);
}

global.init_stage = false;