scr_trace("[TEST] Running test_suite_grid");
var pass = true;

if(!test_create_grid()) pass = false;
if(!test_cables_create_finalize_destroy()) pass = false;
if(!test_three_cables()) pass = false;

return test_show_result(test_suite_grid, pass);