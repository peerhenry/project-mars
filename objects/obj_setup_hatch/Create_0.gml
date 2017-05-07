/// @description Insert description here
// You can write your code in this editor

var bid = layer_get_id("Base");
instance_create_layer(x, y, bid, obj_hatch);

//var wall_id1 = instance_create_layer(x-32, y, bid, obj_wall);
//var wall_id2 = instance_create_layer(x+32, y, bid, obj_wall);

var wall_id1 = instance_position(x-32, y, obj_wall);
var wall_id2 = instance_position(x+32, y, obj_wall);
scr_wall_update_state(wall_id1);
scr_wall_update_state(wall_id2);

instance_destroy();