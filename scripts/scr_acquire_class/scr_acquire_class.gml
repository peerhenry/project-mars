/// @arg instance
/// @arg constructor_args
var instance = argument0;
var args = argument1;

var is_embarkable = scr_instance_inherits(instance, obj_atm) 
	|| instance.object_index == obj_bed
	|| instance.object_index == obj_med_bed;
if(is_embarkable)
{
	instance.class = c_embarkable; // set class
	scr_apply_constructor(c_embarkable, instance, args);
}