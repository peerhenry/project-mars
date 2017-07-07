/// @param dragging
/// @param action_count

var arg_dragging = argument0;
var arg_action_count = argument1;

var active_construction = global.init_active_construction;
var new_actions;
new_actions[arg_action_count - 1] = 0;
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