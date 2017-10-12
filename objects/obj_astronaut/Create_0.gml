script_container = global.script_container;
// movement and drawing
path = path_add();
is_walking = false;
prev_x = x;
prev_y = y;
occ_i = (x - 16) div 32;
occ_j = (y - 16) div 32;
dest_i = occ_i;
dest_j = occ_j;
mp_grid_add_cell(scr_get_nav_grid(), occ_i, occ_j);
up = 1;
down = 2;
right = 3;
left = 4;
moveDir = down;
movement_speed = macro_astronaut_move_speed;

// drawing stuff
sprite_down = spr_character_walk_down;
sprite_right = spr_character_walk_right;
sprite_up = spr_character_walk_up;
sprite_suitless_down = spr_character_suitless_down;
sprite_suitless_right = spr_character_suitless_right;
sprite_suitless_up = spr_character_suitless_up;
image_speed = 0;

// astronaut props
name = "John Doe";
owner = macro_player;
astro_id = 0;
astronaut_health = 100;
suit_oxygen = 100;
wears_suit = true;
is_outside = true;
is_moving_through_gate = false;
has_died = false;
energy = 100;
food_level = 100;
oxygen_consumption = global.astro_oxygen_consumption; // absolute value

// inventory
inventory = ds_grid_create(3,3);
scr_inventory_insert(inventory, macro_inventory_pistol);

// tasks
assigned_object = noone;
current_action = astronaut_action.idle;
construction = noone;

// automatic behavior
auto_attack = true;
auto_construct = true;
auto_eat = true;
auto_sleep = true;
auto_eat_level = 20;
auto_sleep_level = 20;

// combat
target = noone;			// thing to pursue
auto_target = noone;	// thing to auto attack when in range
alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));
enemy_object = noone;
shoot_path = path_add();

// active sprites
sprite_walk_down = sprite_down;
sprite_walk_right = sprite_right;
sprite_walk_up = sprite_up;
// shader stuff
mask_color = [1, 1, 1, 1];