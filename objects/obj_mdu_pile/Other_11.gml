/// @description Interact with assigned astronaut
scr_trace("MDU pile interact event");

// either dump a module here or astronaut takes one.
var astro_inv = assigned_astronaut.inventory;
if(scr_inventory_has_item(astro_inv, macro_inventory_module))
{
	var success = scr_inventory_extract(astro_inv, macro_inventory_module);
	if(success)
	{
		image_index++;
		mdu_count++;
	}
}
else
{
	var success = scr_inventory_insert(astro_inv, macro_inventory_module);
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