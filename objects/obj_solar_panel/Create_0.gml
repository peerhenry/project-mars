event_inherited();
scr_navgrid_occupy(occ_i, occ_j);
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

// Set grid type to select for obj_grid_selector
grid_type_to_select = macro_grid_electric;

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_source, 2);
scr_connect_to_cables(id);