test_message("Running test_suite_drill");
var pass = true;

global.default_resource_amount = 30;
global.resource_amount_metal = 0;

test_drill_acquire_resource();
test_drill_should_destroy_depleted_resource();