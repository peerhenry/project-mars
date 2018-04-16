/// @description				Displays the result of a test.

var pass = global.current_test_pass;

#region check for trailing instances
var counter = 0;
with(all) counter++;
var known_instance_count = 2; //obj_tests and obj_persistent_listener
var interface_count = scr_count_instances(obj_interface);
var signature_count = scr_count_instances(obj_signature);
var type_count = scr_count_instances(obj_type);
var expected_instance_count = known_instance_count + interface_count + signature_count + type_count;
if(counter > expected_instance_count)
{
	pass = false;
	var msg = "WARNING! There are " + string(counter - expected_instance_count) + " trailing instances after: " + global.current_test;
	test_message(msg);
	var assertion_list = global.assertion_map[? global.current_test];
	ds_list_add(assertion_list, msg);
	
	with(all)
	{
		switch(object_index)
		{
			case obj_tests:
			case obj_persistent_listener:
			case obj_interface:
			case obj_signature:
			case obj_type:
				// test_message("Accepted instance: " + object_get_name(object_index));
				break;
			default:
				test_message("Trailing instance: " + object_get_name(object_index));
				instance_destroy();
				break;
		}
	}
}
#endregion

if(pass)
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