/// @param arg_drag_parameter
/// @param arg_draw_paramater
/// @param arg_value
function init_construction_set_drag_parameter(argument0, argument1, argument2) {
	var arg_drag_parameter = argument0;
	var arg_draw_parameter = argument1;
	var arg_value = argument2;

	var drag_draw_params = global.init_active_drag_params[arg_drag_parameter];
	drag_draw_params[@arg_draw_parameter] = arg_value;


}
