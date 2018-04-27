/// @description Interact with assigned astronaut
occupant = assigned_astronaut;
image_index++;
with(assigned_astronaut)
{
	x = other.x;
	y = other.y;
}
scr_unassign_task(id);
// todo: remove this event