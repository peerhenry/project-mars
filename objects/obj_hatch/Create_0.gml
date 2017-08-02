event_inherited();

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall_like);
scr_navgrid_clear_cell(occ_i, occ_j);

depth = -occ_j;	// set depth for tall structures
base_room = noone;

if(connects_horizontally)
{
	scr_execute_map_buffer_action(occ_i + 1, occ_j, map_buffer_action.reserve);
	scr_execute_map_buffer_action(occ_i - 1, occ_j, map_buffer_action.reserve);
	if(!global.draw_tall_walls) sprite_index = spr_hatch_vertical;
}
else
{
	scr_execute_map_buffer_action(occ_i, occ_j + 1, map_buffer_action.reserve);
	scr_execute_map_buffer_action(occ_i, occ_j - 1, map_buffer_action.reserve);
	if(!global.draw_tall_walls) sprite_index = spr_hatch;
}