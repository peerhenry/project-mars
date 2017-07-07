/// @param id
/// @param name
/// @param hud_sprite
/// @param action_count 

// This script initializes a construction that has a single build tile.
// construction -> build tiles -> build tile -> build actions -> build action

var arg_id = argument0;
var arg_name = argument1;
var arg_hud_sprite = argument2;
var arg_action_count = argument3;

// array of build actions
var build_actions;
build_actions[ arg_action_count-1 ] = 0;
global.init_next_action_index = 0;
global.init_active_actions = build_actions;

// build tile
var build_tile;
build_tile[macro_build_tile_actions] = build_actions;
build_tile[macro_build_tile_di] = 0;
build_tile[macro_build_tile_dj] = 0;

// array of build tiles
var build_tiles;
build_tiles[0] = build_tile;
global.init_active_tiles = build_tiles;

init_construction_new(arg_id, arg_name, arg_hud_sprite, build_tiles);