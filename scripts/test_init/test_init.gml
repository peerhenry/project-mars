/// @description	Shows debug message that test is running
/// @arg script		The script or name of the test script.

var arg_script = argument0;
var script_string = arg_script;

global.current_test_pass = true;

if(!is_string(script_string))
{
	if(!script_exists(arg_script)) script_string = "Unknown script";
	else script_string = script_get_name(arg_script);
}

global.current_test = script_string;
ds_map_add(global.assertion_map, script_string, ds_list_create());

test_message("Running: " + script_string);