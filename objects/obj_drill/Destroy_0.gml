event_inherited();
scr_navgrid_clear_cell( occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear);
scr_disconnect_from_cables(id);
audio_stop_sound(drill_sound);