var target_x = argument0;
var target_y = argument1;

var target_i = scr_rc_to_gi(target_x);
var target_j = scr_rc_to_gi(target_y);
var clamped_x = scr_gi_to_rc(target_i);
var clamped_y = scr_gi_to_rc(target_j);
var blid = layer_get_id("base");
var new_wall = instance_create_layer(clamped_x, clamped_y, blid, obj_wall);

// decrease resource cost.

var wall_east = instance_position(clamped_x+32, clamped_y, obj_wall);
var wall_north = instance_position(clamped_x, clamped_y-32, obj_wall);
var wall_west = instance_position(clamped_x-32, clamped_y, obj_wall);
var wall_south = instance_position(clamped_x, clamped_y+32, obj_wall);

scr_wall_update_state(wall_east);
scr_wall_update_state(wall_north);
scr_wall_update_state(wall_west);
scr_wall_update_state(wall_south);

scr_wall_update_state(new_wall);