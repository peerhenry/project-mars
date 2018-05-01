/// @arg class
var class = argument0;

#region check skip standard testing
var deps = cs_get_dependencies(class);
if(variable_instance_exists(deps, "skip_class_standards") && deps.skip_class_standards)
{
	destroy(deps);
	exit;
}
#endregion

test_init("Testing class standards for: " + script_get_name(class));

var intf = in(class, get_interface);
// mock injection arguments 
var inj_args = void_unwrap(intf, "get_injection_args");		// loop over props, filter data props, filter injections
var inj_type_infos = scr_from_select(inj_args, "type_info");
var mock_args = morph(inj_type_infos, "to_mock");
var injections = scr_from_select(mock_args, "value");
var instance = new(class, injections);
// assert all interface data props are inside the instance
var data_props = void_unwrap(intf, "get_data_props");
for(var n = 0; n < array_length_1d(data_props); n++)
{
	var ndp = data_props[n];
	assert_true(variable_instance_exists(instance, ndp.name), "variable exists");
}
// assert methods
var data_props = void_unwrap(intf, "get_data_props");
// destroy
// assert owned data props are destroyed
// destroy mocks

// match interface with clients
var clients = in(class, get_clients);
for(var n = 0; n < array_length_1d(clients); n++)
{
	var client_tup = clients[n];
	var client_class = client_tup.item0;
	var dep_name = client_tup.item1;
	var client_intf = in(client_class, get_interface);
	var dep_inft = call_unwrap(client_intf, "extract_dependency", "name");
	call_unwrap(dep_inft, "assert_implementation", intf);
}

test_result();