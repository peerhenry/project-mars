var container = scenario_register_scripts();
global.script_container = container;
test_message("Running scenario tests...");

test_suite_setup();
test_scenario_rooms();
test_suite_destruct();

script_container_destroy(container);