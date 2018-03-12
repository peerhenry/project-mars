if( scr_inventory_has_item_type(assigned_astronaut.inventory, inv_space.food) )
{
	scr_inventory_transfer(assigned_astronaut.inventory, inventory, inv_space.food);
}
else
{
	scr_inventory_transfer(inventory, assigned_astronaut.inventory, inv_space.food);
}

scr_unassign_task(id);