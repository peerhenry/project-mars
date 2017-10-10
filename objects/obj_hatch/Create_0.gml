scr_trace("hatch create event");
event_inherited();

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall_like);

depth = -occ_j;	// set depth for tall structures
base_room = noone;

if(connects_horizontally)
{
	scr_execute_map_buffer_action(occ_i + 1, occ_j, map_buffer_action.reserve);
	scr_execute_map_buffer_action(occ_i - 1, occ_j, map_buffer_action.reserve);
	if(!global.draw_tall_walls) sprite_index = spr_hatch_vertical;
	else sprite_index = spr_hatch_tall_vertical;
}
else
{
	scr_execute_map_buffer_action(occ_i, occ_j + 1, map_buffer_action.reserve);
	scr_execute_map_buffer_action(occ_i, occ_j - 1, map_buffer_action.reserve);
	if(!global.draw_tall_walls) sprite_index = spr_hatch;
	else sprite_index = spr_hatch_tall;
}