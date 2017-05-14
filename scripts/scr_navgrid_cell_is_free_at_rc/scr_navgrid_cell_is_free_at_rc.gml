var arg_i = scr_rc_to_gi(argument0);
var arg_j = scr_rc_to_gi(argument1);
return mp_grid_get_cell(global.grid_map, arg_i, arg_j) == 0;