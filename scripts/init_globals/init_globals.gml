/// @description Initialize gamewide globals

global.init_stage = true;

// # DEBUG settings
global.draw_room_bb = false;
global.enable_trace = false;
global.debug_start_messages = false; // obsolete?
global.debug_gameplay_messages = true; // obsolete?

ini_open(macro_settings_file);

// -- GAMEPLAY
global.regeneration_speed = ini_read_real("gameplay", "regeneration_speed", 0.01);
global.energy_depletion = ini_read_real("gameplay", "energy_depletion", 0.01); // how fast is idle astronaut losing energy PP/frame

#region OXYGEN

// percentage of oxygen of 1 tile being drained by an open hatch per step.
global.gate_drainage_speed = ini_read_real("oxygen", "gate_drainage_speed", 25);

global.suit_o2_depletion_speed = ini_read_real("oxygen", "suit_depletion_speed", 0.01);

// how fast is health drained from suffocation: HP/step
global.suffocation_speed = ini_read_real("oxygen", "suffocation_speed", 0.5);

 // how fast is suit oxygen replenishing in suit closet PP/step
global.suit_closet_replenishment = ini_read_real("oxygen", "suit_closet_replenishment", 0.2);

#endregion

// -- OXYGEN RENDERING
global.oxygen_empty_level = ini_read_real("oxygen_graphics", "red_stripes_percentage", 1); // if oxygen_level falls below this number, red stripes are drawn.
global.oxygen_max_alpha = ini_read_real("oxygen_graphics", "oxygen_max_alpha", 0.33); // for rendering low oxygen levels

// -- SHOOTING --
global.time_to_shoot = ini_read_real("shooting", "time_to_shoot", 1);
global.projectile_speed  = ini_read_real("shooting", "projectile_speed", 10);
global.projectile_damage = ini_read_real("shooting", "projectile_damage", 10);
var shooting_range = ini_read_real("shooting", "astronaut_shooting_range", 10);
global.shooting_range_squared = shooting_range*shooting_range;

ini_close();

// selected handle for construction
global.build_time_per_cost = 0.01; // one second for each 100 resource cost

// # Gameplay stuff
global.oxygen_bar_color = make_color_rgb(55, 55, 255);

global.resource_amount_metal = 200000;
global.default_resource_amount = 10000;

// -- Runtime vars --

global.construct = noone;
// Used to prevent too many messages from appearing to player
global.message_is_showing = false;
global.draw_tall_walls = true;
global.auto_complete = true; // Used for setup constructions
global.sensor_selected = false;
global.selected_grid = noone;