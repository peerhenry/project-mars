/// @descr evaluate a function as a single unit test
/// @arg script
/// @arg test_function
var script = argument0;
var test_f = argument1;
var scr_name = script_get_name(script);
test_init(scr_name + "." + test_f);
in(script, test_f);
test_result();