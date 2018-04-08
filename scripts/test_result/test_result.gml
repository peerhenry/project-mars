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

var counter = 0;
with(all) counter++;
var expected_instances = 2; //obj_tests and obj_persistent_listener
if(counter > expected_instances)
{
	var msg = "WARNING! There are " + string(counter - expected_instances) + " trailing instances after: " + global.current_test;
	test_message(msg);
	var assertion_list = global.assertion_map[? global.current_test];
	ds_list_add(assertion_list, msg);
	
	with(all)
	{
		if(object_index != obj_tests && object_index != obj_persistent_listener) instance_destroy();
	}
}