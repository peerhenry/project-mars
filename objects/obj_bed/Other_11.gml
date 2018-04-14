/// @description Interact with assigned astronaut
occupant = assigned_astronaut;
image_index++;
with(assigned_astronaut)
{
	x = other.x;
	y = other.y;
}
in(f_astro_disappear, "disappear", assigned_astronaut);
scr_unassign_task(id);