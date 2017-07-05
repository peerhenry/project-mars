var arg_action_count = argument0;

var active_construction = ds_map_find_value(global.construction_map, global.active_construction);
var new_actions;
new_actions[arg_action_count - 1] = 0;
global.active_actions_array = new_actions;
global.next_action_index = 0;
active_construction[@macro_surround_actions] = new_actions;