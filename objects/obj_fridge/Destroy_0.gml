event_inherited();
ds_grid_destroy(inventory);
scr_navgrid_clear_cell( occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear);