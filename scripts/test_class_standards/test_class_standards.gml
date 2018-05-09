/// @arg class
var class = argument0;

test_init("Testing class standards for: " + script_get_name(class));
var info_result = void_static(class, get_class_info);

#region check if standards should be skipped
if(info_result.status == STATUS.PROBLEM)
{
	instance_destroy(info_result);
	exit;
}
#endregion

var info = unwrap(info_result);

#region all the stuff

#region mock injections and create a new instance
var inj_props = void_unwrap(info, "get_injected_props");
var inj_type_infos = scr_from_select(inj_props, "type_info");
var dummy_args = morph(inj_type_infos, "create_dummy");
var instance = new(class, dummy_args);
#endregion

#region assert all interface data props are inside the instance
var data_props = void_unwrap(info, "get_data_props");
var values;
for(var n = 0; n < array_length_1d(data_props); n++)
{
	var ndp = data_props[n];
	assert_true(variable_instance_exists(instance, ndp.name), "variable exists");
	values[n] = variable_instance_get(instance, ndp.name);
}
#endregion

#region test class info method props
var method_props = void_unwrap(info, "get_method_props");
for(var n = 0; n < array_length_1d(method_props); n++)
{
	var method = method_props[n];
	var rt = method.type_info.return_type_info;
	var param_type_infos = scr_from_select(method.type_info.parameters, "type_info");
	var dummy_params = morph(param_type_infos, "create_dummy");
	var result = call(instance, method.name, dummy_params);
	var is_ok = assert_equal(STATUS.OK, result.status, "result is OK");
	if(is_ok)
	{
		call_unwrap(rt, "assert_type", unwrap(result));
	}
}
#endregion

#region test destruction & cleanup
destroy(instance);
for(var n = 0; n < array_length_1d(data_props); n++)
{
	var ndp = data_props[n];
	var dp_val = values[n];
	if(ndp.is_borrowed)
	{
		switch(ndp.type_info.type)
		{
			case TYPE.OBJECT:
				assert_true(instance_exists(dp_val), "instance did not destroy borrowed object");
				instance_destroy(dp_val);
				break;
			case TYPE.LIST:
				assert_true(ds_exists(dp_val, ds_type_list), "instance did not destroy borrowed list");
				ds_list_destroy(dp_val);
				break;
			case TYPE.MAP:
				assert_true(ds_exists(dp_val, ds_type_map), "instance did not destroy borrowed map");
				ds_map_destroy(dp_val);
				break;
		}
	}
	else
	{
		switch(ndp.type_info.type)
		{
			case TYPE.OBJECT:
				assert_false(instance_exists(dp_val), "instance destroyed borrowed object");
				break;
			case TYPE.LIST:
				assert_true(ds_exists(dp_val, ds_type_list), "instance destroyed borrowed list");
				break;
			case TYPE.MAP:
				assert_true(ds_exists(dp_val, ds_type_map), "instance destroyed borrowed map");
				break;
		}
	}
}
#endregion

#region match interface with clients
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
				var dep_is_valid = instance_exists(dep_class_info) && variable_instance_exists(dep_class_info, "class") && dep_class_info.class == c_class_info;
				assert_true(dep_is_valid, "dependency is valid");
				if(dep_is_valid)
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
// else assume thing has no clients (which is no problem)
#endregion

#endregion

destroy(info);
test_result();