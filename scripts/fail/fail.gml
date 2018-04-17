/// @arg message
var msg = argument0;
global.current_test_pass = false;
show_debug_message("[FAIL] " + msg);
var assertion_list = global.assertion_map[? global.current_test];
ds_list_add(assertion_list, msg);