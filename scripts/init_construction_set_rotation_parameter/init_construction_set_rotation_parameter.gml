/// @param arg_rotation_paramater
/// @param arg_draw_paramater
/// @param arg_value
function init_construction_set_rotation_parameter(argument0, argument1, argument2) {
	var arg_rotation_parameter = argument0;
	var arg_draw_parameter = argument1;
	var arg_value = argument2;

	var rotation_params = global.init_active_construction[macro_rotation_params];
	var rotation_draw_params = rotation_params[arg_rotation_parameter];
	rotation_draw_params[@arg_draw_parameter] = arg_value;


}
