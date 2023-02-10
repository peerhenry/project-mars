/// @arg mock_object
/// @arg method
/// @arg times
function mock_verify(argument0, argument1, argument2) {
	var mock_object = argument0;
	var func = argument1;
	var times = argument2;
	call_unwrap(mock_object, "verify", [func, times]);


}
