/// @description Update astronaut

event_inherited();
if(has_died) exit;
scr_step_energy_and_speed(id);
scr_step_hunger_and_health(id);
scr_step_oxygen_and_health(id);

/* OLD: todo: remove
if(has_died)
{
	return;
}

// Kill if health reached zero
if(entity_health <= 0)
{
	scr_kill(id); // destroys astronaut and replaces it with a corpse object.
	exit;
}

// Update energy and speed
scr_step_energy_and_speed(id);

// Update movement
// - Set move direction sprite 
// - check if going through gate
// - set the room
scr_step_nav_grid(id);
scr_step_gate(id);
scr_step_sprite_and_image(id);

// Update whatever astronaut is doing.
scr_update_action(id);

// Update from path
scr_step_path(script_container, id);

scr_step_hunger_and_health(id);
scr_step_oxygen_and_health(id);
*/