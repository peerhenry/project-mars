event_inherited();

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 1);
scr_connect_to_cables(id);

is_selected = false;