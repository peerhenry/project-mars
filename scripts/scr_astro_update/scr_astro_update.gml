/// @arg astronaut
var arg_astro = argument0;

// Kill if health reached zero
if(entity_health <= 0)
{
	scr_kill(arg_astro); // sets has_died, destroys astronaut and replaces it with a corpse object.
	exit;
}

scr_step_nav_grid(arg_astro);
scr_step_gate(arg_astro);
scr_step_sprite_and_image(arg_astro);
scr_step_path(arg_astro);

scr_update_action(arg_astro);

scr_step_sleep_and_speed(arg_astro);
scr_step_hunger_and_health(arg_astro);
scr_step_oxygen_and_health(arg_astro);