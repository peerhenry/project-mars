test_init_globals();
test_message("Running tests...");

var trace_was_enabled = global.enable_trace;
global.enable_trace = false;
global.tests_passed = true;

test_suite_drill();
test_suite_grid();
test_suite_get_owner();
test_suite_construction();
test_suite_pump();
test_suite_astronauts();

global.enable_trace = trace_was_enabled;
return global.tests_passed;