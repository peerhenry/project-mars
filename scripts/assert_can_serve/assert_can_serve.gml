/// @descr This script tests if a given instance can serve a dependency in a given client by checking if the methods of the interface can be called.
/// @arg instance
/// @arg client_class
/// @arg dependency_name

// todo: update this, maybe obsolete?

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
	var mocks = void_unwrap(sig, "get_mocks");
	var mock_values = morph(mocks, "get_value");
	
	// assert result
	var result = call(arg_instance, sig.name, mock_values);
	var exists = instance_exists(result);
	assert_true(exists, "instance_exists(result)");
	if(exists)
	{
		call_unwrap(sig.return_type, "assert_type", result.value);
		destroy(result);
	}
	
	for(var n = 0; n < array_length_1d(mocks); n++)
	{
		var next = mocks[n];
		destroy(next);
	}
}

// assert all methods have been checked
assert_equal(method_count, counter, "check counter");