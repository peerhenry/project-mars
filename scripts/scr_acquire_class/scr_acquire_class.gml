/// @arg instance
/// @arg constructor_args
var instance = argument0;
var args = argument1;

if(scr_instance_inherits(instance, obj_atm))
{
	instance.class = c_embarkable; // set class
	scr_apply_constructor(c_embarkable, instance, args);
}