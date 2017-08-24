/// @description Initialize gamewide globals

global.init_stage = true;

// # DEBUG settings
global.draw_room_bb = false;
global.enable_trace = true;
global.debug_start_messages = false; // obsolete?
global.debug_gameplay_messages = true; // obsolete?

// Used to prevent too many messages from appearing to player
global.message_is_showing = false;

// selected handle for construction
global.construct = noone;
global.build_time_per_cost = 0.01; // one second for each 100 resource cost

// # Gameplay stuff
global.oxygen_bar_color = make_color_rgb(55, 55, 255);
global.gate_drainage_speed = 25; // percentage of oxygen of 1 tile being drained by an open hatch per step.
global.oxygen_empty_level = 1; // if oxygen_level falls below this number, red stripes are drawn.
global.oxygen_max_alpha = 0.33; // for rendering low oxygen levels
global.suit_o2_depletion_speed = 0.01;
global.suffocation_speed = 0.5; // how fast is health drained from suffocation
global.suit_closet_replenishment = 0.2; // how fast is suit oxygen replenishing in suit closet
global.energy_depletion = 0.001;

global.regeneration_speed = 0.01;
global.time_to_shoot = 1;
global.projectile_speed = 30;
global.projectile_damage = 10;
global.shooting_range_squared = 10*10;

global.resource_amount_metal = 200000;
global.draw_tall_walls = true;
global.default_resource_amount = 10000;

global.auto_complete = true; // Used for setup constructions

// # sensor
global.sensor_selected = false;

// # grid selection
global.selected_grid = noone;