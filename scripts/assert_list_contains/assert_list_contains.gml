/// @arg list
/// @arg element
function assert_list_contains(argument0, argument1) {
	var contains = ds_list_find_index(argument0, argument1) >= 0;
	var el = string(argument1);
	if(instance_exists(argument1)) el = object_get_name(argument1.object_index);
	if(!contains) {
		global.current_test_pass = false;
		show_debug_message("[FAIL] Assertion failed: list did not contain " + el);
	}


}
