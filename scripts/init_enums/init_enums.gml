
enum wall_type
{
	horizontal,
	vertical,
	other,
	none
}

enum resource
{
	water,
	metal
}

enum astronaut_action // these are assigned to astronaut objects
{
	idle,
	moving_by_command,
	moving_to_construction,
	moving_to_shoot,
	fetching_mdu,
	delivering_mdu,
	constructing,
	executing_assignment,
	in_combat
}

enum cart_action
{
	idle,
	move,
	pickup,
	deploy
}

enum victory{
	sandbox,
	domination
}; // to add: escape, return to earth

enum reach_state
{
	unreachable,
	reachable,
	adjacent
}

// astronaut hud panel
enum hud_part
{
	none,
	auto_attack,
	auto_construct,
	auto_eat,
	auto_sleep,
	food_bar,
	sleep_bar,
	oxygen_bar
}

enum hud_action
{
	none,
	toggle_astro_panels,
	toggle_robot_panels,
	toggle_menu,
	toggle_zoom,
	
	// new HUD
	toggle_outliner,
	toggle_outliner_astronauts,
	toggle_outliner_robots,
	toggle_outliner_carts,
	toggle_minimap,
	toggle_objectives,
	mission_control
}

enum inv_space
{
	empty = 0,
	occupied = 1,
	pistol = 2,
	rifle = 3,
	food = 4,
	mdu = 5
}