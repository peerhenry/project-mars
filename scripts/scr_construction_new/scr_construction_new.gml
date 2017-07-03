/// @param id
/// @param name
/// @param hud_sprite
/// @param action_count 

var arg_id = argument0;
var arg_name = argument1;
var arg_hud_sprite = argument2;
var arg_action_count = argument3;

// create array of keys
var tile_key_array;
tile_key_array[arg_action_count-1] = 0;
tile_key_array[0] = 0; // first key is 0, corresponding to di = 0 and dj = 0

var build_actions;
build_actions[ arg_action_count-1 ] = 0;

var tile_map = ds_map_create();
ds_map_add(tile_map, 0, build_actions); // key 0 corresponding to di = 0 and dj = 0

global.active_construction = arg_id;
global.active_actions_array = build_actions;
global.next_action_index = 0;

var new_construction;
new_construction[macro_surround_behavior] = noone;
new_construction[macro_drag_behavior] = noone;
new_construction[macro_rotation_behavior] = noone;
new_construction[macro_build_tile_keys] = tile_key_array;
new_construction[macro_build_tile_map] = tile_map;
new_construction[macro_hud_sprite] = arg_hud_sprite;
new_construction[macro_name] = arg_name;
new_construction[macro_id] = arg_id;

ds_map_add(global.construction_map, arg_id, new_construction);