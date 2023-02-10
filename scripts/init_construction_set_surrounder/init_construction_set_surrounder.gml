function init_construction_set_surrounder(argument0) {
	var arg_action_count = argument0;

	var active_construction = global.init_active_construction;
	var new_actions;
	new_actions[arg_action_count - 1] = 0;
	global.init_active_actions = new_actions;
	global.init_next_action_index = 0;
	active_construction[@macro_surround_actions] = new_actions;


}
