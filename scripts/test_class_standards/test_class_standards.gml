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

// assert object index
var obj_indx = cs_get_object_index(class);
assert_true(object_exists(obj_indx), "class object index exists");

// assert dependencies
assert_true(deps == noone || deps.class = c_dependencies, "get_dependencies returns valid result");
if(deps != noone) destroy(deps);

// assert setup & cleanup
var tup = setup_testable(class);
assert_equal(class, tup.item0.class, "constructor gives object with correct class");
if(!ds_exists(global.failed_test_list, ds_type_list)) scr_panic("7global.failed_test_list does not exist anymore!"); // DEBUG
cleanup_testable(tup);

if(!ds_exists(global.failed_test_list, ds_type_list)) scr_panic("8global.failed_test_list does not exist anymore!"); // DEBUG

// in progress: maybe we can also do a get_clients on classes so that can_serve is automated : )
// todo: enable this and get it to work
/*
var clients = in(class, get_clients);
assert_true(clients == noone || <?>, "get_clients returns valid result");
var testable = tup.item0;
assert_can_serve(testable, client_name, cliend_dependency)

*/

test_result();