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

test_message("Running: " + script_string);