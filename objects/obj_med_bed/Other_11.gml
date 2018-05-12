/// @description Interact with assigned astronaut
// occupant = assigned_astronaut;
// image_index++;

if(occupant != noone)
{
	scr_set_grid_prop(id, macro_grid_electric, macro_grid_prop_can_perform_role, true);
}
else scr_set_grid_prop(id, macro_grid_electric, macro_grid_prop_can_perform_role, false);

// scr_navgrid_clear_astronaut(assigned_astronaut);
// deactivate astronaut while it heals
// instance_deactivate_object(assigned_astronaut);
scr_unassign_task(id);

// todo: remove this event