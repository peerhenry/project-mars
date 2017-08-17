/// Get grid cell at room coordinate.
var arg_i = scr_rc_to_gi(argument0);
var arg_j = scr_rc_to_gi(argument1);
return mp_grid_get_cell(global.nav_grid, arg_i, arg_j);