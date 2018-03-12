/// @description Interact with assigned astronaut

var was_inserted = scr_give_entity_new_item(assigned_astronaut, inv_space.food);
if(was_inserted)
{
	food_level = 0;
}
scr_unassign_task(id);