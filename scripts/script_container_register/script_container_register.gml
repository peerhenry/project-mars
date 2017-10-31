/// @arg container
/// @arg name
/// @arg script
var arg_container = argument0;
var arg_name = argument1;
var arg_script = argument2;

debug_type(arg_name, macro_type_string);
if!(script_exists(arg_script)) show_error("Script " + string(arg_script) + " does not exist for" + arg_name, true);

var script_keys = script_container_get_keys(arg_container);
var script_map = script_container_get_map(arg_container);

var existing = script_map[? arg_name];
if(is_undefined(existing))
{
	ds_list_add(script_keys, arg_name);
	ds_map_add(script_map, arg_name, arg_script);
}
else
{
	ds_map_replace(script_map, arg_name, arg_script);
	// show_error("Script for " + arg_name + " is already registered", true);
}