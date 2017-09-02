scr_trace("test_drill_acquire_resource");

var metal = instance_create_depth(32, 32, 0, obj_resource_metal);
var drill = instance_create_depth(32, 32, 0, obj_drill);
drill.under_construction = false;
with(drill){ event_perform(ev_alarm, 0); }
var pass = drill.resource_instance == metal;
instance_destroy(metal);
instance_destroy(drill);
return pass;