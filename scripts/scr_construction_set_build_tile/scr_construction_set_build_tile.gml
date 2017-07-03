var arg_di = argument0;
var arg_dj = argument1;
var arg_action_count = argument2;

var key = (arg_di << 16) | arg_dj;

var action_array;
action_array[arg_action_count-1] = 0;
global.active_actions_array = action_array;
global.next_action_index = 0;
ds_map_add(global.active_tile_map, key, action_array);