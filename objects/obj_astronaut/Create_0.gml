// 1. movement and drawing
path = path_add();
is_walking = false;
prev_x = x;
prev_y = y;
occ_i = (x - 16) div 32;
occ_j = (y - 16) div 32;
prev_i = occ_i;
prev_j = occ_j;
dest_i = occ_i;
dest_j = occ_j;
mp_grid_add_cell(scr_get_nav_grid(), occ_i, occ_j);

up = 1;
down = 2;
right = 3;
left = 4;
moveDir = down;

movement_speed = global.astronaut_move_speed;

// 2. drawing stuff
sprite_down = spr_character_walk_down;
sprite_right = spr_character_walk_right;
sprite_up = spr_character_walk_up;
sprite_suitless_down = spr_character_suitless_down;
sprite_suitless_right = spr_character_suitless_right;
sprite_suitless_up = spr_character_suitless_up;
image_speed = 0;

// 3. astronaut props
name = "John McNeil";
astronaut_health = 100;
suit_oxygen = 100;
wears_suit = true;
is_outside = true;
is_moving_through_gate = false;
has_died = false;
energy = 100;
food_level = 100;

// 4. task
assigned_object = noone;
current_action = astronaut_action.idle;
construction_instance = 0;

// 5. combat
target = noone;			// thing to pursue
auto_target = noone;	// thing to auto attack when in range
auto_attack = true;
alarm[0] = 30*global.time_to_shoot + round(random_range(-5,5));
enemy_object = noone;

// active sprites
sprite_walk_down = sprite_down;
sprite_walk_right = sprite_right;
sprite_walk_up = sprite_up;

// shader stuff

mask_color = [1, 1, 1, 1];