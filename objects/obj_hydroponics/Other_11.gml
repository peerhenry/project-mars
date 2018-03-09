/// @description Interact with assigned astronaut

var was_inserted = scr_inventory_insert_new(assigned_astronaut.inventory, inv_space.food);
if(was_inserted)
{
	food_level = 0;
}
scr_unassign_task(id);