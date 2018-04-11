event_inherited();
scr_navgrid_clear_cell( occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear);
scr_disconnect_from_pipes(id);
scr_disconnect_from_cables(id);
scr_disconnect_pump_from_drills(id);