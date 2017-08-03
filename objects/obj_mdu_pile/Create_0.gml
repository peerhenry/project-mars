event_inherited();

// occupy map grid & nav grid
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

image_speed = 0;
mdu_count = 1;