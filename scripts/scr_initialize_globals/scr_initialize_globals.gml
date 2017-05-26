/// Initialize gamewide globals

// DEBUG settings
global.draw_room_bb = false;
global.debug_start_messages = false;
global.debug_gameplay_messages = true;

// constructions
scr_initialize_constructions();

// selected handle for construction
global.construct = noone;

enum wall_type {
	horizontal,
	vertical,
	other,
	none
}

enum resource {
	water,
	metal
}

// gameplay stuff
global.oxygen_bar_color = make_color_rgb(55, 55, 255);
global.gate_drainage_speed = 25; // percentage of oxygen of 1 tile being drained by an open hatch per step.
global.oxygen_empty_level = 1; // if oxygen_level falls below this number, red stripes are drawn.
global.oxygen_max_alpha = 0.33; // for rendering low oxygen levels
global.suit_o2_depletion_speed = 0.01;
global.suffocation_speed = 0.5; // how fast is health drained from suffocation
global.suit_closet_replenishment = 0.2; // how fast is suit oxygen replenishing in suit closet

global.astronaut_move_speed = 3;
global.regeneration_speed = 0.01;
global.time_to_shoot = 1;
global.projectile_speed = 30;
global.projectile_damage = 10;
global.shooting_range_squared = 10*10;

global.resource_amount_metal = 20000;

// astronaut tasks

enum astronaut_action
{
	idle,
	moving_by_command,
	moving_to_construction,
	constructing
}

// initialize audio groups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);