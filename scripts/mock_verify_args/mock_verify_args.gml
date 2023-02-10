/// @arg mock_object
/// @arg method
/// @arg times
/// @arg args
function mock_verify_args(argument0, argument1, argument2, argument3) {
	var mock_object = argument0;
	var func = argument1;
	var times = argument2;
	var args = argument3;
	mock_verify(mock_object, func, times);
	call_unwrap(mock_object, "verify_last_call_arguments", [func, args]);


}
