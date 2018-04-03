/// @description Interact with assigned astronaut
occupant = assigned_astronaut;
image_index++;

scr_navgrid_clear_astronaut(assigned_astronaut);
with(assigned_astronaut)
{
	script_update = scr_mock;
	visible = false;
	x = other.x;
	y = other.y;
}

scr_unassign_task(id);