/// @descr This script tests if a given instance can serve a dependency in a given client by checking if the methods of the interface can be called.
/// @arg instance
/// @arg client_class
/// @arg dependency_name
var arg_instance = argument0;
var arg_client = argument1;
var arg_dependency_name = argument2;

var class_name = script_get_name(arg_instance.class);
var client_class_name = script_get_name(arg_client);

var deps = cs_get_dependencies(arg_client);
var intf = call_unwrap(deps, "extract_interface", arg_dependency_name);
destroy(deps);
var methods = intf.methods;
var method_count = array_length_1d(methods);
assert_true(method_count > 0, "method_count > 0");
var counter = 0;
for(var m = 0; m < method_count; m++)
{
	counter++;
	// create dummy arguments
	var sig = intf.methods[m];
	var dummies = void_unwrap(sig, "get_dummy_arguments");
	
	// assert result
	var result = call(arg_instance, sig.name, dummies);
	var exists = instance_exists(result);
	assert_true(exists, "instance_exists(result)");
	if(exists)
	{
		call_unwrap(sig.return_type, "assert_type", result.value);
		destroy(result);
	}
	
	#region cleanup dummies
	for(var n = 0; n < array_length_1d(dummies); n++)
	{
		var next = dummies[n];
		if(instance_exists(next))
		{
			if(variable_instance_exists(next, "class") && script_exists(next.class)) destroy(next);
			else instance_destroy(next);
		}
		else if(ds_exists(next, ds_type_map)) ds_map_destroy(next);
		else if(ds_exists(next, ds_type_list)) ds_list_destroy(next);
	}
	#endregion
}

// assert all methods have been checked
assert_equal(method_count, counter, "check counter");