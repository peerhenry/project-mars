/// @arg function
/// @arg args
var function = argument0;
var args = argument1;
var here = fs_test_class_standards;

show_debug_message("fs_test_class_standards." + function);

switch(function)
{

case "run":
	var class = args[0];
	var class_name = script_get_name(class);

	test_init("Testing class standards for: " + class_name);
	var info_result = void_static(class, get_class_info);

	if(info_result.status == STATUS.PROBLEM && info_result.value == PROBLEM.EXCEPTION)
	{
		instance_destroy(info_result);
		exit;
	}

	var info = unwrap(info_result);
	var instance = in(here, "create_instance", [class, info]);
	var prop_values = in(here, "assert_data_props", [instance, info]);
	in(here, "test_run_methods", [instance, info]);
	in(here, "destroy_assert_cleanup", [instance, info, prop_values]);
	in(here, "assert_serves_clients", [class, info]);

	destroy(info);
	test_result();
	break;

#region create_instance
case "create_instance":
	var class = args[0];
	var info = args[1];
	var inj_props = void_unwrap(info, "get_injected_props");
	var inj_type_infos = scr_from_select(inj_props, "type_info");
	var dummy_args = morph(inj_type_infos, "create_dummy");
	return new(class, dummy_args);
#endregion

#region assert_data_props
case "assert_data_props":
	var instance = args[0];
	var info = args[1];
	var data_props = void_unwrap(info, "get_data_props");
	var prop_values = [];
	for(var n = 0; n < array_length_1d(data_props); n++)
	{
		var ndp = data_props[n];
		// skip arrays because sadly GMS returns false in variable_instance_exists for empty arrays :(
		if(!ndp.type_info.type == TYPE.ARRAY) assert_true(variable_instance_exists(instance, ndp.name), "variable \"" + ndp.name + "\" exists.");
		prop_values[n] = variable_instance_get(instance, ndp.name);
	}
	return prop_values;
#endregion

#region test_run_methods
case "test_run_methods":
	var instance = args[0];
	var info = args[1];
	var method_props = void_unwrap(info, "get_method_props");
	foreach_f_ap(method_props, here, "test_run_method", [arg_mark(), instance]); // foreach thing, apply a function with arguments
	break;
#endregion

#region test_run_method
case "test_run_method":
	var method = args[0];
	var instance = args[1];
	// show_debug_message("test_run_method, method class: " + script_get_name(method.class // DEBUG
	var rt = method.type_info.return_type_info;
	var params = method.type_info.parameters;
	var param_type_infos = scr_from_select(params, "type_info");
	var dummy_params = morph(param_type_infos, "create_dummy");
	var result = call(instance, method.name, dummy_params);
	var expect_exception = method.type_info.throws_exception;
	var is_ok = STATUS.OK == result.status;
		
	if(expect_exception)
	{
		assert_false(is_ok, "result from calling " + method.name + " should not be OK");
		instance_destroy(result);
	}
	else assert_true(is_ok, "result from calling " + method.name + " should be OK");
	
	if(is_ok)
	{
		var returny = unwrap(result);
		call_unwrap(rt, "assert_type", returny);
		if(rt.is_on_heap)
		{
			switch(rt.type)
			{
				case TYPE.INTERFACE:
					destroy(returny);
					break;
				case TYPE.OBJECT:
					instance_destroy(returny);
					break;
				case TYPE.LIST:
					ds_list_destroy(returny);
					break;
				case TYPE.MAP:
					ds_map_destroy(returny);
					break;
			}
		}
	}
	// assert cleanup dummy params
	for(var m = 0; m < scr_length(params); m++)
	{
		var next_param = params[m];
		var val = dummy_params[m];
		if(next_param.type_info.is_on_heap) in(here, "assert_argument_cleanup", [val, !next_param.is_consumed, next_param.type_info.type]);
	}
	break;
#endregion

#region assert_argument_cleanup
case "assert_argument_cleanup":
	var value = args[0];
	var should_exist = args[1];
	var type = args[2];
	var assertion = should_exist ? assert_true : assert_false;
	var thing_string = "undefined";
	var expect_do_string = should_exist ? "should not destroy borrowed " : "should destroy owned "
	var exists = false;
	switch(type)
	{
		case TYPE.INTERFACE:
			exists = instance_exists(value);
			thing_string = "class instance";
			if(should_exist) destroy(value);
			break;
		case TYPE.OBJECT:
			exists = instance_exists(value);
			thing_string = "object";
			if(should_exist) instance_destroy(value);
			break;
		case TYPE.LIST:
			exists = ds_exists(value, ds_type_list)
			thing_string = "list";
			if(should_exist) ds_list_destroy(value);
			break;
		case TYPE.MAP:
			exists = ds_exists(value, ds_type_map);
			thing_string = "map";
			if(should_exist) ds_map_destroy(value);
			break;
		default:
			scr_panic("expecting a cleanup on a thing that does not cleanup");
	}
	var assert_msg = "instance " + expect_do_string + thing_string;
	script_execute(assertion, exists, assert_msg);
	break;
#endregion

#region destroy_assert_cleanup
case "destroy_assert_cleanup":
	var instance = args[0];
	var info = args[1];
	var prop_values = args[2];
	var data_props = void_unwrap(info, "get_data_props");
	
	destroy(instance);
	assert_false(instance_exists(instance), "thing was destroyed with destroy function");
	for(var n = 0; n < array_length_1d(data_props); n++)
	{
		var ndp = data_props[n];
		var dp_val = prop_values[n];
		if(ndp.type_info.is_on_heap) in(here, "assert_argument_cleanup", [dp_val, ndp.is_borrowed, ndp.type_info.type]);
	}
	break;
#endregion

#region assert_serves_clients
case "assert_serves_clients":
	var class = args[0];
	var info = args[1];
	var clients_result = void_static(class, get_clients); // clients are tuples containing the client class and the dependency name
	if(clients_result.status == STATUS.OK)
	{
		var clients = unwrap(clients_result);
		for(var n = 0; n < array_length_1d(clients); n++)
		{
			var client_tup = clients[n];
			var client_class = client_tup.item0;
			var dep_name = client_tup.item1;
			var client_intf_result = void_static(client_class, get_class_info);
			if(client_intf_result.status == STATUS.OK)
			{
				var client_intf = unwrap(client_intf_result);
				var dependency_result = call(client_intf, "extract_dependency", dep_name);
				var dep_is_ok = assert_equal(STATUS.OK, dependency_result.status, "dependency " + dep_name + "is extracted OK from " + script_get_name(client_intf));
				if(dep_is_ok)
				{
					var dep_class_info = unwrap(dependency_result);
					var dep_exists = instance_exists(dep_class_info);
					assert_true(dep_exists, "dependency is valid: it exists and is an instance of c_class_info");
					if(dep_exists)
					{
						var dep_is_valid = variable_instance_exists(dep_class_info, "class") && dep_class_info.class == c_class_info;
						assert_true(dep_is_valid, "dependency is valid: it exists and is an instance of c_class_info");
					}
					if(dep_exists && dep_is_valid)
					{
						call_unwrap(dep_class_info, "assert_match", info); // assert info fits the dependency
					}
				}
				destroy(client_intf);
			}
			else
			{
				fail("Client could not return an OK class info result");
				instance_destroy(client_intf_result);
			}
			destroy(client_tup);
		}
	}
	break;
#endregion
}