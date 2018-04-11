/// @description Check if drill can mine
#macro macro_event_drill_mine_check 9
// check if drill can mine
var has_resource = instance_exists(resource_instance);
var has_solid = has_resource && scr_instance_inherits(resource_instance, obj_resource_solid);
var can_dump = active_bucket != noone;
var has_fluid = has_resource && resource_instance.object_index == obj_resource_water;
var has_pumps = pump_count > 0;
var is_active = (has_solid && can_dump) || (has_fluid && has_pumps);
scr_set_grid_prop(id, macro_grid_electric, macro_grid_prop_can_perform_role, is_active);
event_user(macro_event_grid_notify);