/// @description Initialize level globals

global.init_stage = true;
global.hovering_over_gui = false;
global.mousedrag_from = mousedrag_from.none;

// # DEBUG settings
global.draw_room_bb = false;
global.debug_start_messages = false; // obsolete?
global.debug_gameplay_messages = true; // obsolete?

ini_open(macro_settings_file);
var section = "common";

// %LOCALAPPDATA%/project_mars

// -- GAMEPLAY
section = "astronauts";
global.regeneration_speed = init_global_real(section, "regeneration_speed", 0.01);
global.astro_move_speed = init_global_real(section, "move_speed", 3);

// -- OXYGEN
// TODO: refactor oxygen to make absolute calculations instead of percentages
section = "oxygen";
// percentage of oxygen of 1 tile being drained by an open hatch per step.
global.gate_drainage_speed = init_global_real(section, "gate_drainage_speed", 25);
// how fast is health drained from suffocation: HP/step
global.suffocation_speed = init_global_real(section, "suffocation_speed", 0.5);
 // how fast is suit oxygen replenishing in suit closet PP/step
global.suit_closet_replenishment = init_global_real(section, "suit_closet_replenishment", 0.3);

// TODO: unify these two
global.suit_o2_depletion_speed = init_global_real(section, "suit_depletion_speed", 0.001); // prev 0.01
global.astro_oxygen_consumption = init_global_real(section, "astronaut_consumption", 0.01); // prev 0.1

// -- HUNGER
section = "food";
global.hunger_speed = init_global_real(section, "hunger_speed", 0.01);
global.starvation_speed = init_global_real(section, "starvation_speed", 0.01);
global.auto_eat_hunger_level = init_global_real(section, "auto_eat_hunger_level", 20);
global.auto_eat_player = init_global_real(section, "auto_eat_player", 0);
global.auto_eat_nonplayer = init_global_real(section, "auto_eat_nonplayer", 1);

// - SLEEP
section = "sleep";
global.sleep_level_depletion = init_global_real(section, "sleep_level_depletion", 0.01); // how fast is idle astronaut losing energy PP/frame
global.sleep_speed = init_global_real(section, "sleep_speed", 0.06);
global.auto_sleep_level = init_global_real(section, "auto_sleep_level", 20);
global.auto_sleep_player = init_global_real(section, "auto_sleep_player", 0);
global.auto_sleep_nonplayer = init_global_real(section, "auto_sleep_nonplayer", 1);

// - obj_task_actor
section = "actor";
global.auto_attack_player = init_global_real(section, "auto_attack_player", 0);
global.auto_attack_nonplayer = init_global_real(section, "auto_attack_nonplayer", 0);
global.auto_construct_player = init_global_real(section, "auto_construct_player", 1);
global.auto_construct_nonplayer = init_global_real(section, "auto_construct_nonplayer", 1);

// -- MED BED
section = "med_bed"
global.heal_speed = init_global_real(section, "heal_speed", 0.06);
global.med_bed_energy_consumption = init_global_real(section, "energy_consumption", 1);

// -- OXYGEN RENDERING
section = "oxygen_graphics";
global.oxygen_empty_level = init_global_real(section, "red_stripes_percentage", 1); // if oxygen_level falls below this number, red stripes are drawn.
global.oxygen_max_alpha = init_global_real(section, "oxygen_max_alpha", 0.33); // for rendering low oxygen levels
var o_r = init_global_real(section, "oxygen_bar_color_r", 100);
var o_g = init_global_real(section, "oxygen_bar_color_g", 100);
var o_b = init_global_real(section, "oxygen_bar_color_b", 255);

// -- BAR COLORS
global.oxygen_bar_color = make_color_rgb(o_r, o_g, o_b);
global.health_bar_color = c_lime; // make_color_rgb(h_r, h_g, h_b);
global.sleep_bar_color = c_yellow; // make_color_rgb(s_r, s_g, s_b);
global.food_bar_color = c_orange; // make_color_rgb(f_r, f_g, f_b);

// -- SHOOTING -- // todo: replace this section with "weapons"
section = "shooting";
global.time_to_shoot = init_global_real(section, "time_to_shoot", 1);
global.projectile_speed  = init_global_real(section, "projectile_speed", 30);
global.projectile_damage = init_global_real(section, "projectile_damage", 10);
var shooting_range = init_global_real(section, "astronaut_shooting_range", 10); // todo: use weapon range instead
global.shooting_range = shooting_range;
global.shooting_range_squared = shooting_range*shooting_range;

// -- GRIDS --
section = "grids";
global.sensor_energy_consumption = init_global_real(section, "sensor_energy_consumption", 1);
global.drill_energy_consumption = init_global_real(section, "drill_energy_consumption", 5);
global.pump_energy_consumption = init_global_real(section, "pump_energy_consumption", 2);
global.pump_water_production = init_global_real(section, "pump_water_production", 20);
global.electrolyser_energy_consumption = init_global_real(section, "electrolyser_energy_consumption", 1);
global.hydroponics_water_consumption = init_global_real(section, "hydroponics_water_consumption", 1);
global.solar_panel_energy_production = init_global_real(section, "solar_panel_energy_production", 2);

// -- ROBOTS --
section = "robots"
global.robot_idle_battery_drain = init_global_real(section, "idle_battery_drain", 0.001);
global.robot_move_battery_drain = init_global_real(section, "move_battery_drain", 0.01);
global.robot_move_speed = init_global_real(section, "move_speed", 3);

// -- WORMS --
section = "worms"
global.worm_speed = init_global_real(section, "worm_speed", 1);
global.worm_speed_underground = init_global_real(section, "worm_speed_underground", 1);

ini_close();

// seconds
global.build_time_sec_minimum = 2;
global.build_time_sec_per_mdu = 1;

// # Gameplay stuff
global.active_constructions = ds_list_create();
global.setup_mdu_pile_size = 1;
global.resource_amount_metal = 200000;
global.default_resource_amount = 10000;

// ownership
global.ownership_behavior = macro_ownership_default;
global.default_owner = macro_player; // change to setup owner

// -- Runtime vars --

// Used to prevent too many messages from appearing to player
global.message_is_showing = false;
global.draw_tall_walls = true;
global.sensor_selected = false;
global.selected_grid = noone;

// colors
global.hud_border_color = c_aqua;
global.enemy_suit_color = [0,0,0,1];
global.laser_sound_time = 0;
global.cart_deploy_mode = false;