var container = scenario_register_scripts();
global.script_container = container;
test_message("Running scenario tests...");

test_suite_setup();
test_scenario_rooms();
test_suite_destruct();
test_hatch_clears_navgrid();
test_destroy_from_damage_wall_door();

script_container_destroy(container);