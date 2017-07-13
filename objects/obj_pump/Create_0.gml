event_inherited();
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_consumer, 2);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_source, 2);