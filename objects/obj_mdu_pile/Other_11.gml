/// @description Interact with assigned astronaut
scr_trace("MDU pile interact event");

// either dump a module here or astronaut takes one.
var astro_inv = assigned_astronaut.inventory;
if(scr_inventory_has_item_type(astro_inv, inv_space.mdu))
{
	var mdu = scr_inventory_extract(astro_inv, inv_space.mdu);
	if(mdu != noone)
	{
		image_index++;
		mdu_count++;
		instance_destroy(mdu);
	}
}
else
{
	var success = scr_give_entity_new_item(assigned_astronaut, inv_space.mdu);
	if(success)
	{
		mdu_count--;
		image_index--;
	}
}

// for now, keeping assignment logic for mdu piles is the easy way.
is_assigned = false;
assigned_astronaut.assigned_object = noone;
assigned_astronaut = noone;
if(icon != noone)
{
	instance_destroy(icon);
	icon = noone;
}

if(mdu_count == 0)
{
	instance_destroy();
}