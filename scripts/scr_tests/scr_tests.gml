var container = test_register_scripts();
global.script_container = container;
test_message("Running tests...");

//test_suite_objects();
test_suite_grid();
test_suite_get_owner();
test_suite_construction();
test_suite_astronauts();
test_suite_rooms();
test_suite_misc();
test_suite_gui();
test_suite_room();

script_container_destroy(container);