/// @description				Displays the result of a test.
/// @arg {string} script_name The name of the test script.
/// @arg {bool} passed Did the script pass?

var arg_script = argument0;
var arg_result = argument1;
var script_string = arg_script;

if(!is_string(script_string))
{
	if(!script_exists(arg_script)) script_string = "Unknown script";
	else script_string = script_get_name(arg_script);
}

if(arg_result)
{
	show_debug_message("[TEST] " + script_string + " PASSED.");
}
else show_debug_message("[TEST] " + script_string + " FAILED!");

return arg_result;