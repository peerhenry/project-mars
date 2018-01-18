event_inherited();

// occupy map grid & nav grid
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);
depth = -occ_j;
image_speed = 0;
mdu_count = global.setup_mdu_pile_size;
image_index = mdu_count - 1;
under_construction = false;