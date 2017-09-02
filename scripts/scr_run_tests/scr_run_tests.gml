init_globals();
scr_trace("[TEST] Running tests...");

var all_passed = true;

if(!test_add_to_grid_logic_map()) all_passed = false;
if(!test_add_to_grid_tile_map()) all_passed = false;
if(!test_suite_drill()) all_passed = false;
if(!test_suite_grid()) all_passed = false;

return test_show_result("All tests ", all_passed);