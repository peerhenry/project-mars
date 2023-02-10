/// @arg instance_id
function scr_is_class_instance(argument0) {
	var thing = global.class_instance_registry[? argument0];
	return !is_undefined(thing);


}
