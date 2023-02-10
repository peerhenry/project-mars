function scr_drill_has_water(argument0) {
	var arg_drill = argument0;
	var res = arg_drill.resource_instance;
	return instance_exists(res) && res.object_index == obj_resource_water;


}
