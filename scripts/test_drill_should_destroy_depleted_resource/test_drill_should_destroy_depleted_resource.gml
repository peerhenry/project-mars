scr_trace("test_drill_should_destroy_depleted_resource");

// Arrange
var metal = instance_create_depth(32, 32, 0, obj_resource_metal);
metal.amount = -10;
var drill = instance_create_depth(32, 32, 0, obj_drill);
with(drill){
	event_user(macro_event_finalize);
}
var grid = scr_get_grid(drill, macro_grid_electric);
debug_grid(grid); // DEBUG
grid.net_output = 100; // set grid to have plenty of power.

// Act
with(drill){ event_perform(ev_alarm, 0); }
var res_is_gone = !instance_exists(drill.resource_instance);

// Cleanup
instance_destroy(drill);

// Assert
if(!instance_exists(metal) && res_is_gone) return true
else{
	show_debug_message("[TEST] failed. Expected object metal to not exist.");
	instance_destroy(metal);
	return false;
}