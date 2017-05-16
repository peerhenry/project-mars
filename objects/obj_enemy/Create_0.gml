// 1. movement and drawing
path = path_add();
is_walking = false;
prev_x = x;
prev_y = y;

occ_i = (x - 16) div 32;
occ_j = (y - 16) div 32;
mp_grid_add_cell(global.grid_map, occ_i, occ_j);

up = 1;
down = 2;
right = 3;
left = 4;
moveDir = down;

movement_speed = 3;
image_speed = 0;

is_selected = false;

// 2. health and oxygen
astronaut_health = 100;
suit_oxygen = 100;
wears_suit = true;
is_outside = true;
is_moving_through_gate = false;
has_died = false;

// 3. task
assigned_object = noone;