event_inherited();

if(!do_destroy_logic) exit;

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear_cable);
scr_disconnect_from_cables(id);