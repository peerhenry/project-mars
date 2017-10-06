/// @description				Displays the result of a test.

if(global.current_test_pass)
{
	ds_list_add(global.passed_test_list, global.current_test);
	test_message(global.current_test + " PASSED.");
}
else
{
	ds_list_add(global.failed_test_list, global.current_test);
	global.tests_passed = false;
	test_message(global.current_test + " FAILED!");
}