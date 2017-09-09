/// @description Under constructions must be destroyed immediately
// This script needs to be post creation becasuse the owner needs to be set first.
scr_trace("Calling alarm[0] on obj_destruct...");
var base_component = instance_position(x, y, obj_base_component);

if(base_component == noone)
{
	scr_warn("base_component was noone where an obj_destruct was created.");
	instance_destroy();
	exit;
}

// The destruct owner must be the same as base component owner
if(base_component.owner != owner)
{
	scr_warn("base_component had different owner than obj_destruct.");
	instance_destroy();
	exit;
}

if(base_component.under_construction)
{
	scr_cancel_construction(base_component.construction_instance);
	instance_destroy();
}