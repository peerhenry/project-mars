/// @arg class
/// @arg test_method
var arg_class = argument0;
var arg_method = argument1;
var class_name = script_get_name(arg_class);
test_init(class_name + "." + arg_method);
var ref = script_execute(arg_class, arg_method);
if(instance_exists(ref)) // if it returns something, it is a refused request result
{
	destroy(ref);
	fail("Test method does not exist: " + string(arg_method));
}
test_result_expect_fail();