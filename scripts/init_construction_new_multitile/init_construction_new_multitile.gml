var arg_id = argument0;
var arg_name = argument1;
var arg_hud_sprite = argument2;
var arg_tile_count = argument3;

var new_construction;

var tile_key_array;
tile_key_array[arg_tile_count-1] = 0;

var tile_map = ds_map_create();
global.active_tile_map = tile_map;

new_construction[macro_surround_behavior] = noone;
new_construction[macro_drag_behavior] = noone;
new_construction[macro_rotation_behavior] = noone;
new_construction[macro_build_tile_keys] = tile_key_array;
new_construction[macro_build_tile_map] = tile_map;
new_construction[macro_hud_sprite] = arg_hud_sprite;
new_construction[macro_name] = arg_name;
new_construction[macro_id] = arg_id;

ds_map_add(global.constructions, arg_id, new_construction);