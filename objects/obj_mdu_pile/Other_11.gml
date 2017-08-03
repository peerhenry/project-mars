/// @description Interact with assigned astronaut

// either dump a module here or astronaut takes one.
var astro_inv = assigned_astronaut.inventory;
if(scr_inventory_has_item(astro_inv, macro_inventory_module))
{
	image_index++;
	mdu_count++;
	scr_inventory_extract(astro_inv, macro_inventory_module);
}
else
{
	image_index--;
	mdu_count--;
	scr_inventory_insert(astro_inv, macro_inventory_module);	
}

scr_unassign_task(id);