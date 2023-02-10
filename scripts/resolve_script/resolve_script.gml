/// @arg container
/// @arg name
function resolve_script(argument0, argument1) {
	var arg_container = argument0;
	var arg_name = argument1;

	var script_map = script_container_get_map(arg_container);
	var result = script_map[? arg_name];
	if(is_undefined(result) || !script_exists(result)) show_error("Script resolve error: could not resolve " + arg_name, true);
	return result;


}
