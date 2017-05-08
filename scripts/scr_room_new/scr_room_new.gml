var arg_x = argument0;
var arg_y = argument1;

var or_x = scr_rc_clamp_origin(arg_x);
var or_y = scr_rc_clamp_origin(arg_y);

var room_layer = layer_get_name("rooms");
var new_room = instance_create_layer(arg_x, arg_y, room_layer, obj_room);
with(new_room){
	bb_left = or_x;
	bb_top = or_y;
	bb_right = bb_left + 32;
	bb_bottom = bb_top + 32;
}

var i = scr_rc_to_gi(arg_x);
var j = scr_rc_to_gi(arg_y);
scr_add_tile_to_room(new_room, i, j);

return new_room;