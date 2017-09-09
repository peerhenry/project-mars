/// @description Run tests

passed = scr_run_tests();
done = true;
if(passed)
{
	msg = "Tests passed";
	color = c_lime;
}
else
{
	msg = "Tests failed";
	color = c_red;
}
alarm[1] = 5;