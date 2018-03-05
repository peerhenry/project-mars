event_inherited();
var room_remove_tile_and_part = resolve(script_container, "room_remove_tile_and_part");
script_execute(room_remove_tile_and_part, x, y);
var wall = instance_position(x, y, obj_wall);
if(wall == noone) scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.clear_and_outside);
else scr_execute_map_buffer_action(occ_i, occ_j, map_buffer_action.outside);