test_init(test_drill_should_dump_in_bucket);

// arrange
var metal = instance_create_depth(32, 32, 0, obj_resource_metal);
var drill = instance_create_depth(32, 32, 0, obj_drill);
with(drill) event_user(macro_event_finalize);
var grid = scr_get_grid(drill, macro_grid_electric);
grid.net_output = 100000; // make sure drill can draw from grid
var bucket = instance_create_depth(32, 64, 0, obj_bucket);
with(bucket) event_user(macro_event_finalize);

// act
with(drill){ event_perform(ev_alarm, 0); } // mine
// assert
assert_equal(bucket, drill.active_bucket, "drill.active_bucket");
assert_equal(1, bucket.image_index, "bucket.image_index");

// cleanup
instance_destroy(metal);
instance_destroy(drill);
instance_destroy(bucket);

test_result();