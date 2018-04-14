/// @arg class
/// @arg test_method
var arg_class = argument0;
var arg_method = argument1;
var class_name = script_get_name(arg_class);
test_init(class_name + "." + arg_method);
script_execute(arg_class, arg_method);
test_result();