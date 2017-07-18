event_inherited();

// oxygen grid
scr_set_new_grid_props(id, macro_grid_oxygen, macro_grid_role_storage, 100);

max_value = 100;

scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);