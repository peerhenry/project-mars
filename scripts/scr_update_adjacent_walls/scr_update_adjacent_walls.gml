var arg_x = argument0;
var arg_y = argument1;

var wall_east = instance_position(arg_x + 32, arg_y, obj_wall);
var wall_north = instance_position(arg_x, arg_y  - 32, obj_wall);
var wall_west = instance_position(arg_x - 32, arg_y, obj_wall);
var wall_south = instance_position(arg_x, arg_y + 32, obj_wall);

if(wall_east != noone) scr_wall_update_state(wall_east);
if(wall_north != noone) scr_wall_update_state(wall_north);
if(wall_west != noone) scr_wall_update_state(wall_west);
if(wall_south != noone) scr_wall_update_state(wall_south);