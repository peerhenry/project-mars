/// @description Interact with assigned astronaut
occupant = assigned_astronaut;
image_index++;

// deactivate astronaut while it sleeps
instance_deactivate_object(assigned_astronaut);
scr_navgrid_clear_astronaut(assigned_astronaut);

assigned_astronaut.current_action = astronaut_action.idle;
scr_unassign_task(id);