var arg_x = argument0;
var arg_y = argument1;

var clear_or_wall = scr_grid_cell_at_rc(arg_x, arg_y) == 0 || instance_position(arg_x, arg_y, obj_wall) != noone;

return clear_or_wall
&& scr_validate_wall_for_basetile(arg_x+32, arg_y+32) // check surrounding tiles
&& scr_validate_wall_for_basetile(arg_x+32, arg_y)
&& scr_validate_wall_for_basetile(arg_x+32, arg_y-32)
&& scr_validate_wall_for_basetile(arg_x, arg_y+32)
&& scr_validate_wall_for_basetile(arg_x, arg_y-32)
&& scr_validate_wall_for_basetile(arg_x-32, arg_y+32)
&& scr_validate_wall_for_basetile(arg_x-32, arg_y)
&& scr_validate_wall_for_basetile(arg_x-32, arg_y-32);