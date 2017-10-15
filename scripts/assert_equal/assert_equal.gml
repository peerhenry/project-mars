/// @arg expected
/// @arg result
/// @arg parameter_name
var equal = argument0 == argument1;

var expected = test_as_string(argument0, argument2);
var result = test_as_string(argument1, argument2);

if(!equal)
{
	global.current_test_pass = false;
	var message = "[FAIL] Assertion: " + string(argument2) + ": expected: " + expected + " actual: " + result;
	show_debug_message(message);
	var assertion_list = global.assertion_map[? global.current_test];
	ds_list_add(assertion_list, message);
}