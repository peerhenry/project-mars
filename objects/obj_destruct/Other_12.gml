/// @description Finalize construction
var base_component = instance_position(x, y, obj_base_component);
if(base_component != noone)
{
	instance_destroy(base_component);
}
else
{
	// try to remove foundation
	var base_foundation = instance_position(x, y, obj_base_foundation);
}

scr_recalculate_paths();
instance_destroy();