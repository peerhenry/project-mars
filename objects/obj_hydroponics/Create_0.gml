event_inherited();

scr_navgrid_occupy(occ_i, occ_j);
scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.occupy);

scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_consumer, 2);

depth = -occ_j;

food_level = 100;