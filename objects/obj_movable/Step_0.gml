/// @description Update movable

if(has_died) exit;

// Kill if health reached zero
if(entity_health <= 0)
{
	scr_kill(id); // destroys astronaut and replaces it with a corpse object.
	exit;
}

scr_step_nav_grid(id);
scr_step_gate(id);
scr_step_sprite_and_image(id);
scr_step_path(id);