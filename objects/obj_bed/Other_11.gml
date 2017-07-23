/// @description Interact with assigned astronaut
occupant = assigned_astronaut;
image_index++;

scr_navgrid_clear_astronaut(assigned_astronaut);

// deactivate astronaut while it sleeps
instance_deactivate_object(assigned_astronaut);

scr_unassign_task(id);