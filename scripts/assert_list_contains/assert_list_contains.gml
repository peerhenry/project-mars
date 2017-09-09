/// @arg list
/// @arg element
var contains = ds_list_find_index(argument0, argument1) >= 0;
var el = string(argument1);
if(instance_exists(argument1)) el = object_get_name(argument1.object_index);
if(!contains) {
	global.tests_passed = false;
	show_debug_message("[FAIL] Assertion failed: list did not contain " + el);
}