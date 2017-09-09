test_init(test_drill_acquire_resource);

// arrange
var metal = instance_create_depth(32, 32, 0, obj_resource_metal);
var drill = instance_create_depth(32, 32, 0, obj_drill);
drill.under_construction = false;
// act
with(drill){ event_perform(ev_alarm, 0); }
// assert
assert_equal(metal, drill.resource_instance, "drill.resource_instance");

// cleanup
test_message("instance_count BEFORE cleanup... " + string(instance_count));
instance_destroy(metal);
instance_destroy(drill);
test_message("instance_count AFTER cleanup... " + string(instance_count));

test_result();