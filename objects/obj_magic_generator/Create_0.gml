event_inherited();
grid_type_to_select = macro_grid_electric;
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_source, 10);

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);