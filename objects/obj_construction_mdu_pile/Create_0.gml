event_inherited();

image_speed = 0;
occ_i = scr_rc_to_gi(x);
occ_j = scr_rc_to_gi(y);
depth = -occ_j;
mp_grid_add_cell( scr_get_nav_grid(), occ_i, occ_j );