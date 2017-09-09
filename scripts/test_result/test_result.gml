/// @description				Displays the result of a test.

if(global.current_test_pass)
{
	test_message(global.current_test + " PASSED.");
}
else
{
	global.tests_passed = false;
	test_message(global.current_test + " FAILED!");
}