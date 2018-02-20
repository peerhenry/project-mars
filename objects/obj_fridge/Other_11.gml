if( scr_inventory_has_item(assigned_astronaut.inventory, macro_inventory_food) )
{
	scr_inventory_transfer(assigned_astronaut.inventory, inventory, macro_inventory_food);
}
else
{
	scr_inventory_transfer(inventory, assigned_astronaut.inventory, macro_inventory_food);
}

scr_unassign_task(id);