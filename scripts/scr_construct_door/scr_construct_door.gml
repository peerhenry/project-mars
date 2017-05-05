var target_x = argument0;
var target_y = argument1;

var target_i = scr_rc_to_gi(target_x);
var target_j = scr_rc_to_gi(target_y);
var clamped_x = scr_gi_to_rc(target_i);
var clamped_y = scr_gi_to_rc(target_j);
var blid = layer_get_id("base");
instance_create_layer(clamped_x, clamped_y, blid, obj_door);