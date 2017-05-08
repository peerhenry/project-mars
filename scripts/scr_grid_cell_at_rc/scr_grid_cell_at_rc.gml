/// Get grid cell at room coordinate.
var i = scr_rc_to_gi(argument0);
var j = scr_rc_to_gi(argument1);
return mp_grid_get_cell(global.grid_map, i, j);