/// @description Finalize
event_inherited();
scr_connect_drill_to_buckets(id);
var has_solid_resource = resource_instance != noone && scr_instance_inherits(resource_instance, obj_resource_solid);
if(has_solid_resource) alarm_set(macro_alarm_mine_metal, room_speed);