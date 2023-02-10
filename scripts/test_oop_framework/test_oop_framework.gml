function test_oop_framework() {
	// test the dummy classes
	test_class(c_tester);
	test_class(c_standards_tester);
	test_class(c_serve_client_tester);
	test_class(c_dummy_child);
	test_class(c_parameter_consumer);
	// test the testing-framework-classes
	test_class(c_type_info);
	test_class(c_class_info);
	test_class(c_class_property);
	test_class(c_method_info);
	test_class(c_parameter);
	test_class(c_mock);
	// test OOP framework classes
	test_class(c_result);
	test_class(c_action);
	test_class(c_action_decorator);
	test_class(c_action_script);
	test_class(c_delay);
	test_class(c_tuple);
	test_class(c_ioc_container);
	// custom tests
	test_class(c_test_selection);


}
