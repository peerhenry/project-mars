var arg_action_count = argument0;

var constr_id = global.active_construction;

var active_construction = ds_map_find_value(global.construction_map, constr_id);

var new_actions;
new_actions[arg_action_count - 1] = 0;
global.active_actions_array = new_actions;
global.next_action_index = 0;

active_construction[@macro_surround_behavior] = new_actions;