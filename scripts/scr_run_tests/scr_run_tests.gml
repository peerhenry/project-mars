var all_passed = true;

init_globals();

if(!test_create_grid()) all_passed = false;
if(!test_add_to_grid_logic_map()) all_passed = false;
if(!test_add_to_grid_tile_map()) all_passed = false;
if(!test_suite_drill()) all_passed = false;

return all_passed;