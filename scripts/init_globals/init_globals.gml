/// @description Initialize gamewide globals

// # DEBUG settings
global.draw_room_bb = false;
global.debug_start_messages = false;
global.debug_gameplay_messages = true;

// # constructions
init_constructions();

// used for adjacency numbers
#macro east_number 1
#macro north_number 2
#macro west_number 4
#macro south_number 8

#macro macro_east_number 1
#macro macro_north_number 2
#macro macro_west_number 4
#macro macro_south_number 8

// selected handle for construction
global.construct = noone;
global.build_time_per_cost = 0.01; // one second for each 100 resource cost

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

// # gameplay stuff
global.oxygen_bar_color = make_color_rgb(55, 55, 255);
global.gate_drainage_speed = 25; // percentage of oxygen of 1 tile being drained by an open hatch per step.
global.oxygen_empty_level = 1; // if oxygen_level falls below this number, red stripes are drawn.
global.oxygen_max_alpha = 0.33; // for rendering low oxygen levels
global.suit_o2_depletion_speed = 0.01;
global.suffocation_speed = 0.5; // how fast is health drained from suffocation
global.suit_closet_replenishment = 0.2; // how fast is suit oxygen replenishing in suit closet

#macro macro_astronaut_move_speed 3
global.regeneration_speed = 0.01;
global.time_to_shoot = 1;
global.projectile_speed = 30;
global.projectile_damage = 10;
global.shooting_range_squared = 10*10;

global.resource_amount_metal = 20000;

// # custom events

#macro macro_event_grid_notify 0	// A grid (water/electric/etc.) updates
#macro macro_event_interact 1		// Astronaut interact with assignable object
#macro macro_event_finalize 2		// finalize construction event

// # electric grid stuff

init_grids();

// # astronaut stuff

enum astronaut_action // these are assigned to astronaut objects
{
	idle,
	moving_by_command,
	moving_to_construction,
	move_to_attack,
	constructing,
	executing_assignment,
	in_combat
}

#macro macro_inventory_empty 0
#macro macro_inventory_occupied 1	// not used for rendering
#macro macro_inventory_pistol 2
#macro macro_inventory_food 3
#macro macro_inventory_module 4

// x, y coordinate encodings for 3x3 grid
#macro macro_astronaut_inventory_0_0 0
#macro macro_astronaut_inventory_0_1 1	// x: 0, y: 1
#macro macro_astronaut_inventory_0_2 2
#macro macro_astronaut_inventory_1_0 4
#macro macro_astronaut_inventory_1_1 5
#macro macro_astronaut_inventory_1_2 6
#macro macro_astronaut_inventory_2_0 8
#macro macro_astronaut_inventory_2_1 9
#macro macro_astronaut_inventory_2_2 10

// # initialize audio groups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);

// # sensor
global.sensor_selected = false;
#macro macro_sensor_d_squared 49
#macro macro_sensor_d 7

// # grid selection
global.selected_grid = noone;