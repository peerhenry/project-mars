/// @arg expected
/// @arg result
/// @arg error
/// @arg message
function assert_approximate(argument0, argument1, argument2, argument3) {
	var expected = argument0;
	var result = argument1;
	var arg_error = argument2;
	var abs_diff = abs(argument0 - argument1);
	var within_error = abs_diff < arg_error;

	if(!within_error)
	{
		global.current_test_pass = false;
		show_debug_message("[FAIL] Assertion: " + string(argument3) + ": " + string(result) + " was not within " + string(arg_error) + "of expected: " + string(expected));
	}


}
