construction_instance = noone;
under_construction = false;
damage = 0;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
encoded_ij = scr_encode_grid_coord(occ_i, occ_j);
grid_props_map = ds_map_create();