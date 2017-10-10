/// @description Finalize construction
event_inherited();

scr_navgrid_clear_cell(occ_i, occ_j);

// Set sprite
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

// Connect hatch to a room
scr_hatch_connect(id);