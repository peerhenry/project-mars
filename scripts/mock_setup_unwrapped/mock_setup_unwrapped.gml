/// @arg mock
/// @arg method
/// @arg return_value
function mock_setup_unwrapped(argument0, argument1, argument2) {
	var mocky = argument0;
	var func = argument1;
	var returny = argument2;
	mock_setup(mocky, func, ok(returny));


}
