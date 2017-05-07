var arg_x = argument0;
var arg_y = argument1;

// for a wall around a basetile it is valid either:
// - when tile has a basetile; wall will NOT be built.
// - when tile has a wall; wall will NOT be build
// - grid is clear; wall WILL be build

var has_basetile = instance_position(arg_x, arg_y, obj_base_tile) != noone;
if(has_basetile) return true;

var has_wall = instance_position(arg_x, arg_y, obj_wall) != noone;
if(has_wall) return true;

i = scr_rc_to_gi(arg_x);
j = scr_rc_to_gi(arg_y);
return mp_grid_get_cell(global.grid_map, i, j) == 0;