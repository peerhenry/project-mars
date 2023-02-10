/// @param di
/// @param dj
/// @param action_count
function init_construction_set_tile(argument0, argument1, argument2) {

	var arg_di = argument0;
	var arg_dj = argument1;
	var arg_action_count = argument2;

	// make a new action array for build tile
	var action_array;
	action_array[arg_action_count-1] = 0;
	global.init_active_actions = action_array;
	global.init_next_action_index = 0;

	// make a new build tile with new actions
	var new_build_tile;
	new_build_tile[macro_build_tile_actions] = action_array;
	new_build_tile[macro_build_tile_di] = arg_di;
	new_build_tile[macro_build_tile_dj] = arg_dj;

	// put build tile in construction's array of build tiles
	var build_tiles = global.init_active_tiles;
	build_tiles[@global.init_next_tile_index] = new_build_tile;

	global.init_next_tile_index++;


}
