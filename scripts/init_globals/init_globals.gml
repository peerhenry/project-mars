/// @description Initialize gamewide globals

global.init_stage = true;

// # DEBUG settings
global.draw_room_bb = false;
global.enable_trace = debug_mode;
global.debug_start_messages = false; // obsolete?
global.debug_gameplay_messages = true; // obsolete?

ini_open(macro_settings_file);

// -- GAMEPLAY
global.regeneration_speed = ini_read_real("gameplay", "regeneration_speed", 0.01);
global.energy_depletion = ini_read_real("gameplay", "energy_depletion", 0.01); // how fast is idle astronaut losing energy PP/frame

// -- OXYGEN
// percentage of oxygen of 1 tile being drained by an open hatch per step.
global.gate_drainage_speed = ini_read_real("oxygen", "gate_drainage_speed", 25);
//global.suit_o2_depletion_speed = ini_read_real("oxygen", "suit_depletion_speed", 0.01);
global.suit_o2_depletion_speed = ini_read_real("oxygen", "suit_depletion_speed", 1);
// how fast is health drained from suffocation: HP/step
global.suffocation_speed = ini_read_real("oxygen", "suffocation_speed", 0.5);
 // how fast is suit oxygen replenishing in suit closet PP/step
global.suit_closet_replenishment = ini_read_real("oxygen", "suit_closet_replenishment", 0.3);
global.astro_oxygen_consumption = ini_read_real("oxygen", "astronaut_consumption", 0.1);

// -- OXYGEN RENDERING
global.oxygen_empty_level = ini_read_real("oxygen_graphics", "red_stripes_percentage", 1); // if oxygen_level falls below this number, red stripes are drawn.
global.oxygen_max_alpha = ini_read_real("oxygen_graphics", "oxygen_max_alpha", 0.33); // for rendering low oxygen levels

// -- SHOOTING --
global.time_to_shoot = ini_read_real("shooting", "time_to_shoot", 1);
global.projectile_speed  = ini_read_real("shooting", "projectile_speed", 30);
global.projectile_damage = ini_read_real("shooting", "projectile_damage", 10);
var shooting_range = ini_read_real("shooting", "astronaut_shooting_range", 10);
global.shooting_range = shooting_range;
global.shooting_range_squared = shooting_range*shooting_range;

// -- GRIDS --
global.sensor_energy_consumption = ini_read_real("grids", "sensor_energy_consumption", 1);
global.drill_energy_consumption = ini_read_real("grids", "drill_energy_consumption", 5);
global.pump_energy_consumption = ini_read_real("grids", "pump_energy_consumption", 2);
global.pump_water_production = ini_read_real("grids", "pump_water_production", 20);
global.electrolyser_energy_consumption = ini_read_real("grids", "electrolyser_energy_consumption", 1);
global.hydroponics_water_consumption = ini_read_real("grids", "hydroponics_water_consumption", 1);
global.solar_panel_energy_production = ini_read_real("grids", "solar_panel_energy_production", 2);

ini_close();

// seconds
global.build_time_sec_minimum = 2;
global.build_time_sec_per_mdu = 1;

// # Gameplay stuff
global.oxygen_bar_color = make_color_rgb(55, 55, 255);

global.resource_amount_metal = 200000;
global.default_resource_amount = 10000;

// ownership
global.ownership_behavior = macro_ownership_default;
global.default_owner = macro_player;

// -- Runtime vars --

// Used to prevent too many messages from appearing to player
global.message_is_showing = false;
global.draw_tall_walls = true;
global.auto_complete = true; // Used for setup constructions
global.sensor_selected = false;
global.selected_grid = noone;

// Skirmish

var skirmish_settings = ds_map_create();
ds_map_add(skirmish_settings, macro_skirmish_victory_condition, victory.domination);
ds_map_add(skirmish_settings, macro_skirmish_astro_count, 5);

global.skirmish_settings = skirmish_settings;