event_inherited();
scr_navgrid_occupy(occ_i, occ_j);

adjacency_numer = 0;

scr_set_new_grid_props(id, macro_grid_electric, macro_grid_role_carrier, 0);
scr_set_new_grid_props(id, macro_grid_water, macro_grid_role_carrier, 0);

scr_set_basetile_lights(id);