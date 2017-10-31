/// @arg expected
/// @arg object_index
var arg_expected = argument0;
var arg_object = argument1;

var count = 0;
with(arg_object)
{
	count++;
}
assert_equal(arg_expected, count, object_get_name(arg_object) + " count");