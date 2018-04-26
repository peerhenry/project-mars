/// @arg mock_object
/// @arg method
/// @arg times
var mock_object = argument0;
var method = argument1;
var times = argument2;
var args = argument3;
mock_verify(mock_object, method, times);
call_unwrap(mock_object, "verify_last_call_arguments", [method, args]);