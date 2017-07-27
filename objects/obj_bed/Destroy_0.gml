scr_navgrid_clear_cell( occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear);
scr_navgrid_clear_cell(occ_i + di, occ_j + dj);
scr_execute_map_buffer_action(occ_i + di, occ_j + dj, map_buffer_action.clear);