event_inherited();
scr_navgrid_occupy(occ_i, occ_j);

is_selected = false;

// electric grid
scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 1);
scr_connect_to_cables(id);

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);