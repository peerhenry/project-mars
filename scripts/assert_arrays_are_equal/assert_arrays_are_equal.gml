/// @arg expected
/// @arg result

var equal = true;

if(array_length_1d(argument0) != array_length_1d(argument1))
{
	equal = false;
}

if(equal)
{
	for(var n = 0; n < array_length_1d(argument0); n++)
	{
		if(argument0[n] != argument1[n]) equal = false;
	}
}

if(!equal)
{
	global.current_test_pass = false;
	show_debug_message("[FAIL] Array assertion: expected: " + string(argument0) + " actual: " + string(argument1));
}