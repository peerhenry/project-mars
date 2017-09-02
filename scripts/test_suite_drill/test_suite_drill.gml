scr_trace("Running test_suite_drill");
var pass = true;

global.default_resource_amount = 30;
global.nav_grid = noone;
global.map_buffer = noone;
global.resource_amount_metal = 0;

if(!test_drill_acquire_resource()) pass = false;
if(!test_drill_should_destroy_depleted_resource()) pass = false;

return pass;