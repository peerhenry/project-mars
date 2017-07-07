/// @param construction_id
/// @param name
/// @param hud_sprite
/// @param tile_count

// This script initializes a construction that has multiple build tiles
// construction -> build tiles -> build tile -> build actions -> build action
// with this script you cannot use init_construction_set_action BEFORE init_construction_set_tile

var arg_id = argument0;
var arg_name = argument1;
var arg_hud_sprite = argument2;
var arg_tile_count = argument3;

var build_tiles;
build_tiles[arg_tile_count-1] = 0;
global.init_active_tiles = build_tiles;
global.init_next_tile_index = 0;

init_construction_new(arg_id, arg_name, arg_hud_sprite, build_tiles);