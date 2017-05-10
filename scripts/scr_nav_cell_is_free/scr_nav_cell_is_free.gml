arg_x = argument0;
arg_y = argument1;

var i = scr_rc_to_gi(arg_x);
var j = scr_rc_to_gi(arg_y);

return mp_grid_get_cell(scr_get_nav_grid, i, j) == 0;