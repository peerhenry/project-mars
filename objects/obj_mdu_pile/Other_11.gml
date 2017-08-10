/// @description Interact with assigned astronaut

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
		if(mdu_count == 0)
		{
			instance_destroy();
		}
		else image_index--;
	}
}

scr_unassign_task(id);