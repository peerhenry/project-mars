event_inherited();
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );

electric_type = electric.source;
electric_consumption = -10;