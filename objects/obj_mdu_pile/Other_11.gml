/// @description Interact with assigned astronaut
scr_trace("MDU pile interact event");

// either dump a module here or astronaut takes one.
var astro_inv = assigned_astronaut.inventory;
if(scr_inventory_has_item_type(astro_inv,  inv_space.mdu))
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
	var success = scr_inventory_insert_new(astro_inv, inv_space.mdu);
	if(success)
	{
		mdu_count--;
		image_index--;
	}
}

var astro = assigned_astronaut;
var action = astro.current_action;
scr_unassign_task(id);

with(astro)
{
	if(action == astronaut_action.fetching_mdu)
	{
		scr_deliver_mdu_after_fetch(astro);
	}
}

if(mdu_count == 0)
{
	instance_destroy();
}