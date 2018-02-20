show_debug_message("---");
show_debug_message("FRIDGE INTERACT EVENT");

if( scr_inventory_has_item(assigned_astronaut.inventory, macro_inventory_food) )
{
	show_debug_message("FROM ASTRO TO FRIDGE");
	scr_inventory_transfer(assigned_astronaut.inventory, inventory, macro_inventory_food);
}
else
{
	show_debug_message("FROM FRIDGE TO ASTRO");
	scr_inventory_transfer(inventory, assigned_astronaut.inventory, macro_inventory_food);
}

show_debug_message("FRIDGE:");
debug_write_inventory(inventory);
show_debug_message("ASTRO:");
debug_write_inventory(assigned_astronaut.inventory);
show_debug_message("---");

scr_unassign_task(id);