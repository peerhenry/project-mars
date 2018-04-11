test_init(test_drill_should_destroy_depleted_resource);

// Arrange
var metal = instance_create_depth(32, 32, 0, obj_resource_metal);
metal.amount = -1;
var drill = instance_create_depth(32, 32, 0, obj_drill);
drill.active_bucket = instance_create_depth(32, 64, 0, obj_bucket);
drill.active_bucket.under_construction = false;
with(drill)	event_user(macro_event_finalize);
var grid = scr_get_grid(drill, macro_grid_electric);
grid.net_output = 100; // set grid to have plenty of power.

// Act
with(drill){ event_perform(ev_alarm, 0); }
var res_is_gone = !instance_exists(drill.resource_instance);

// Cleanup
instance_destroy(drill.active_bucket);
instance_destroy(drill);

// Assert
assert_false(instance_exists(metal), "instance_exists(metal)");
assert_true(res_is_gone, "res_is_gone");

if(instance_exists(metal))
{
	instance_destroy(metal);
}

test_result();