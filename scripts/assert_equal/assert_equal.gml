/// @arg expected
/// @arg result
/// @arg message
var equal = argument0 == argument1;

if(!equal)
{
	global.current_test_pass = false;
	show_debug_message("[FAIL] Assertion: " + string(argument2) + ": expected: " + string(argument0) + " actual: " + string(argument1));
}