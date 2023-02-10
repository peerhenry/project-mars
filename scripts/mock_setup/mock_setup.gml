/// @arg mock
/// @arg method
/// @arg return_result
function mock_setup(argument0, argument1, argument2) {
	var mocky = argument0;
	var func = argument1;
	var returny = argument2;
	call_unwrap(mocky, "setup_stub", [func, returny]);


}
