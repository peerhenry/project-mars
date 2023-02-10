function test_result_pass_param(argument0) {
	var pass = argument0;

#region check for trailing instances
	void_unwrap(global.ioc_container, "clear_resolvings"); // everything that was resolved will be destroyed;
	var counter = 0;
	with(all) counter++;
	var known_instance_count = 2; //obj_tests and obj_persistent_listener
	var interface_count = scr_count_instances(obj_interface);
	var signature_count = scr_count_instances(obj_signature);
	var type_count = scr_count_instances(obj_type_info);
	var ioc_container_count = scr_count_instances(obj_ioc_container);
	var expected_instance_count = known_instance_count + interface_count + signature_count + type_count + ioc_container_count;
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
				case obj_type_info:
				case obj_ioc_container:
					// test_message("Accepted instance: " + object_get_name(object_index));
					break;
				default:
					var obj_details = object_get_name(object_index);
					if(variable_instance_exists(id, "class") && script_exists(class)) obj_details = obj_details + " " + script_get_name(class);
					test_message("Trailing instance: " + obj_details);
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


}
