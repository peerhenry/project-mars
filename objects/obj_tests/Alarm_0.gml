// run tests

passed = scr_run_tests();
is_done = true;
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