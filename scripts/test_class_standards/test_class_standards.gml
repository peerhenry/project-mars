/// @arg class
var class = argument0;
test_init("Testing class standards for: " + script_get_name(class));

var deps = in(class, get_dependencies);
assert_true(deps == noone || deps.class = c_dependencies, "get_dependencies returns valid result");
if(deps != noone) destroy(deps);

var tup = setup_testable(class);
assert_equal(class, tup.item0.class, "constructor gives object with correct class");
cleanup_testable(tup);

// todo: maybe we can also do a get_clients on classes so that can_serve is automated : )
/*
var clients = in(class, get_clients);
assert_true(clients == noone || <?>, "get_clients returns valid result");
var testable = tup.item0;
assert_can_serve(testable, client_name, cliend_dependency)

*/

test_result();