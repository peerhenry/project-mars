test_init_globals();
// not ideal that this is needed in test initialization. Maybe can be removed by resolving issues with the script container...
var inst_layer = layer_get_id("Instances");
init_constructions_create_map(inst_layer, inst_layer, inst_layer);
var container = test_register_scripts();
global.script_container = container;
var trace_was_enabled = global.enable_trace;
global.enable_trace = false;
global.tests_passed = true;

test_message("Running tests...");
scr_tests();

global.enable_trace = trace_was_enabled;
script_container_destroy(container);
return global.tests_passed;