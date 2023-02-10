/// @param dragging
function init_construction_set_dragging_simple(argument0) {

	var arg_dragging = argument0;

	var active_construction = global.init_active_construction;

	var tiles = active_construction[macro_build_tiles];
	var first_tile = tiles[0];
	var actions = first_tile[macro_build_tile_actions];
	var length = array_length_1d(actions);

	var new_actions;
	new_actions[length - 1] = 0;

	array_copy(new_actions, 0, actions, 0, length);

	global.init_active_actions = new_actions;
	global.init_next_action_index = 0;

	var drag_params;
	drag_params[macro_drag_top] = init_new_draw_params_default();
	drag_params[macro_drag_bottom] = init_new_draw_params_default();
	drag_params[macro_drag_vertical] = init_new_draw_params_default();
	drag_params[macro_drag_left] = init_new_draw_params_default();
	drag_params[macro_drag_right] = init_new_draw_params_default();
	drag_params[macro_drag_horizontal] = init_new_draw_params_default();
	global.init_active_drag_params = drag_params;

	active_construction[@macro_dragging] = arg_dragging;
	active_construction[@macro_drag_actions] = new_actions;
	active_construction[@macro_drag_params] = drag_params;


}
