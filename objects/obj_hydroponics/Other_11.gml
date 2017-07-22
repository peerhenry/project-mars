/// @description Interact with assigned astronaut

var was_inserted = scr_astronaut_insert(assigned_astronaut, macro_inventory_food);
if(was_inserted)
{
	food_level = 0;
}
scr_unassign_task(id);