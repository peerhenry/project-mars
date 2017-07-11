event_inherited();
scr_navgrid_occupy(occ_i, occ_j);

show_debug_message("wall created!");
var is_free = scr_navgrid_cell_is_free(occ_i, occ_j);
show_debug_message("after creation, cell free at " + string(occ_i) + ", " + string(occ_j) + ": " + string(is_free));

adjacentcy_numer = 0;

electric_type = electric.carrier;