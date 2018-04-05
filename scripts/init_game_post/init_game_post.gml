scr_trace("Calling init_game_post");

with(obj_pipe) scr_connect_pipe(id);
with(obj_constructable)
{
	scr_connect_to_cables(id);
}
with(obj_wall)
{
	scr_set_basetile_lights(id);
	scr_connect_wall(id);
}
with(obj_gate) scr_connect_gate(id);

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