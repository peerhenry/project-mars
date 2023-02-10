function test_array_prop() {

	// case 1: OK

	// arrange
	var inst = instance_create_depth(0,0,0, obj_empty); // vanilla object, contains nothing
	// act
	inst.my_array = [];
	// assert
	assert_false(is_undefined(inst.my_array), "1 my_array should not be undefined");
	assert_true(variable_instance_exists(inst, "my_array"), "1 variable_instance_exists should be true");
	assert_equal("array", typeof(inst.my_array), "1 my_array should be of type string");
	// cleanup
	instance_destroy(inst);

	// case 2: OK

	// arrange
	var inst = instance_create_depth(0,0,0, obj_empty); // vanilla object, contains nothing
	// act
	var aa = 1;
	var bb = 0;
	inst.my_array = (aa == bb) ? [1,2,3] : [];
	// assert
	assert_false(is_undefined(inst.my_array), "2 my_array should not be undefined");
	assert_true(variable_instance_exists(inst, "my_array"), "2 variable_instance_exists should be true");
	assert_equal("array", typeof(inst.my_array), "2 my_array should be of type string");
	// cleanup
	instance_destroy(inst);

	// case 3: OK

	// arrange
	var inst = instance_create_depth(0,0,0, obj_empty); // vanilla object, contains nothing
	// act
	var aa = 1;
	var bb = 1;
	inst.my_array = (aa == bb) ? [1,2,3] : [];
	// assert
	assert_false(is_undefined(inst.my_array), "3 my_array should not be undefined");
	assert_true(variable_instance_exists(inst, "my_array"), "3 variable_instance_exists should be true");
	assert_equal("array", typeof(inst.my_array), "3 my_array should be of type string");
	// cleanup
	instance_destroy(inst);

	// case 4: OK

	// arrange
	var inst = instance_create_depth(0,0,0, obj_empty); // vanilla object, contains nothing
	// act
	var aa = 0;
	var bb = 1;
	if(aa == bb) inst.my_array = [1,2,3]
	else inst.my_array = [];
	// assert
	assert_false(is_undefined(inst.my_array), "4 my_array should not be undefined");
	assert_true(variable_instance_exists(inst, "my_array"), "4 variable_instance_exists should be true");
	assert_equal("array", typeof(inst.my_array), "4 my_array should be of type string");
	// cleanup
	instance_destroy(inst);

	// case 5: this one fails because somehow "arguments" cannot be found by variable_instance_exists

	// arrange
	/*
	var inst = instance_create_depth(0,0,0, obj_empty); // vanilla object, contains nothing
	// act
	inst.arguments = "three and four";
	// assert
	assert_false(is_undefined(inst.arguments), "5 arguments should not be undefined");
	assert_true(variable_instance_exists(inst, "arguments"), "5 variable_instance_exists should be true");
	assert_equal("array", typeof(inst.arguments), "5 my_array should be of type string");
	// cleanup
	instance_destroy(inst);
	*/


}
