var tile_list = argument0;
var left = argument1;
var top = argument2;
var right = argument3;
var bottom = argument4;

var room_layer = layer_get_name("rooms");
var new_room = instance_create_layer(0, 0, room_layer, obj_room);
with(new_room){
	bb_left = left;
	bb_top = top;
	bb_right = right;
	bb_bottom = bottom;
	ds_list_copy(tiles, tile_list);
}
ds_list_destroy(tile_list);

return new_room;