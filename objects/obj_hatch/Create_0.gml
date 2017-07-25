event_inherited();

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.wall_like);
scr_navgrid_clear_cell(occ_i, occ_j);

depth = -occ_j;	// set depth for tall structures
base_room = noone;