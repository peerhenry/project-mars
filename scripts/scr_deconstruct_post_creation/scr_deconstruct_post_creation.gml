/// @description Under constructions must be destroyed immediately
/// @arg deconstruct_instance
// This script needs to be post creation becasuse the owner needs to be set first.
scr_trace("obj_destruct post creation...");
with(argument0)
{
	var base_component = instance_position(x, y, obj_base_component);
	if(base_component == noone) base_component = instance_position(x, y, obj_base_foundation);
	else if(base_component.object_index == obj_mdu_pile) base_component = noone;
	
	if(base_component == noone)
	{
		scr_warn("base_component was noone where an obj_destruct was created.");
		if(construction_instance != noone) scr_destroy_construction(construction_instance);
		instance_destroy();
		exit;
	}
	// The destruct owner must be the same as base component owner
	if(base_component.owner != owner)
	{
		scr_warn("base_component had different owner than obj_destruct.");
		if(construction_instance != noone) scr_destroy_construction(construction_instance);
		instance_destroy();
		exit;
	}
	if(base_component.under_construction)
	{
		scr_cancel_construction(script_container, base_component.construction_instance);
		if(construction_instance != noone) scr_destroy_construction(construction_instance);
		instance_destroy();
	}
}