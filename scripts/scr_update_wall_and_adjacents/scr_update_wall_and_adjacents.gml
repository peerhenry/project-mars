var arg_x = argument0;
var arg_y = argument1;

scr_update_adjacent_walls(arg_x, arg_y);
var wall = instance_position(arg_x, arg_y, obj_wall);
with(wall) scr_wall_update_state(wall);