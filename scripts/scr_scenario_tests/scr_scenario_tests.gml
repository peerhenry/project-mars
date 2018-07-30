var container = scenario_register_scripts();
global.script_container = container;
test_message("Running scenario tests...");

test_suite_setup();
test_suite_scenarios_construction();
test_destroy_from_damage_wall_door();
test_suite_objects();

script_container_destroy(container);