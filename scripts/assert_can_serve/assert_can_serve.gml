/// @descr This script tests if a given instance can serve a dependency in a given client by checking if the methods of the interface can be called.
/// @arg instance
/// @arg client_class
/// @arg dependency_name
var arg_instance = argument0;
var arg_client = argument1;
var arg_dependency_name = argument2;

var class_name = script_get_name(arg_instance.class);
var client_class_name = script_get_name(arg_client);
// test_init(class_name + " can serve " + client_class_name + " as " + arg_dependency_name);

var intf = get_dependency(arg_client, arg_dependency_name);
var methods = intf.methods;
for(var n = 0; n < array_length_1d(methods); n++)
{
	var method = methods[n];
	var sig = intf.signatures[?method];
	var dummies = call_unwrap(sig, "get_dummy_arguments");
	var result;
	switch(array_length_1d(dummies))
	{
		case 0:
			result = call(arg_instance, method);
			break;
		case 1:
			result = call(arg_instance, method, dummies[0]);
			break;
		case 2:
			result = call(arg_instance, method, dummies[0], dummies[1]);
			break;
		case 3:
			result = call(arg_instance, method, dummies[0], dummies[1], dummies[2]);
			break;
		case 4:
			result = call(arg_instance, method, dummies[0], dummies[1], dummies[2], dummies[3]);
			break;
		case 5:
			result = call(arg_instance, method, dummies[0], dummies[1], dummies[2], dummies[3], dummies[4]);
			break;
	}
	var exists = instance_exists(result);
	assert_true(exists, "instance_exists(result)");
	if(exists)
	{
		call_unwrap(sig.return_type, "assert_type", result.value);
		destroy(result);
	}
}

// test_result();