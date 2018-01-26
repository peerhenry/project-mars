/// @arg tile_list
/// @arg bb_left
/// @arg bb_top
/// @arg bb_right
/// @arg bb_bottom
var tile_list = argument0;
var left = argument1;
var top = argument2;
var right = argument3;
var bottom = argument4;

scr_force_trace("CREATING ROOM..."); // DEBUG

var container = global.script_container;
var get_layer = script_container_resolve(container, "get_layer_for");
var rooms_layer = script_execute(get_layer, obj_room);
var new_room = instance_create_layer(left, top, rooms_layer, obj_room);
with(new_room){
	bb_left = left;
	bb_top = top;
	bb_right = right;
	bb_bottom = bottom;
	ds_list_copy(tiles, tile_list);
}
// tile_list will be destroyed in scr_room_part

// Connect to O2 grid belonging to the basetile at the first tile coordinate of the list.
var first_tile = ds_list_find_value(tile_list, 0);
var tile_i = first_tile >> 16;
var tile_j = first_tile mod 65536;
var tile_x = scr_gi_to_rc(tile_i);
var tile_y = scr_gi_to_rc(tile_j);
var base_tile = instance_position(tile_x, tile_y, obj_base_tile);
var o2_grid = scr_get_grid(base_tile, macro_grid_oxygen);
show_debug_message("new room gets O2 grid: " + string(o2_grid) + " from " + string(tile_i) + ", " + string(tile_j)); // DEBUG
scr_connect_to_grid(o2_grid, new_room);

return new_room;