/// @descr Use this to give an existing instance a class (other way around from creating the instance through new)
/// @arg instance
/// @arg constructor_args
function scr_apply_class(argument0, argument1, argument2) {
	var instance = argument0;
	var class = argument1;
	var args = argument2;

	instance.class = class;
	scr_apply_constructor(class, instance, args);


}
